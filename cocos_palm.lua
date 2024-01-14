-- © 2016, Rogier <rogier777@gmail.com>
-- Translation support
local S = minetest.get_translator("moretrees")

-- Some constants

local coconut_drop_ichance = 8

-- Make the cocos palm fruit trunk a real trunk (it is generated as a fruit)
local trunk = minetest.registered_nodes["moretrees:palm_trunk"]
local ftrunk = {}
local gftrunk = {}
for k,v in pairs(trunk) do
	ftrunk[k] = v
	gftrunk[k] = v
end
ftrunk.tiles = {}
gftrunk.tiles = {}
for k,v in pairs(trunk.tiles) do
	ftrunk.tiles[k] = v
	gftrunk.tiles[k] = v
end
ftrunk.drop = "moretrees:palm_trunk"
gftrunk.drop = "moretrees:palm_trunk"
ftrunk.after_destruct = function(pos, oldnode)
	local coconuts = minetest.find_nodes_in_area(
		{x=pos.x-1, y=pos.y, z=pos.z-1},
		{x=pos.x+1, y=pos.y, z=pos.z+1},
		{"group:moretrees_coconut"}
	)
	for _,coconutpos in pairs(coconuts) do
		-- minetest.dig_node(coconutpos) does not cause nearby coconuts to be dropped :-( ...
		--minetest.dig_node(coconutpos)
		local items = minetest.get_node_drops(minetest.get_node(coconutpos).name)
		minetest.swap_node(coconutpos, {name = "air"})
		for _, itemname in pairs(items) do
			minetest.add_item(coconutpos, itemname)
		end
	end
end
-- Make the different trunk types distinguishable (but barely)
ftrunk.tiles[1] = "moretrees_palm_trunk_top.png^[transformR90"
gftrunk.tiles[1] = "moretrees_palm_trunk_top.png^[transformR180"
gftrunk.description = gftrunk.description.." (gen)"
minetest.register_node("moretrees:palm_fruit_trunk", ftrunk)
minetest.register_node("moretrees:palm_fruit_trunk_gen", gftrunk)

-- Spawn initial coconuts

-- Spawn initial coconuts
-- (Instead of coconuts, a generated-palm fruit trunk is generated with the tree. This
--  ABM converts the trunk to a regular fruit trunk, and spawns some coconuts)
minetest.register_abm({
	nodenames = { "moretrees:palm_fruit_trunk_gen" },
	interval = 6,
	chance = 1,
	min_y = -16,
	max_y = 48,
	label = "converts palm trunk to a regular fruit trunk, and spawns some coconuts",
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.swap_node(pos, {name="moretrees:palm_fruit_trunk"})
		local poslist = minetest.find_nodes_in_area(
			{x=pos.x-1, y=pos.y, z=pos.z-1},
			{x=pos.x+1, y=pos.y, z=pos.z+1},
			"air"
		)
		local genlist = {}
		for k,v in pairs(poslist) do
			genlist[k] = {x = math.random(100), pos = v}
		end
		table.sort(genlist, function(a, b) return a.x < b.x; end)
		local count = 0
		for _, gen in pairs(genlist) do
			minetest.swap_node(gen.pos, {name = "moretrees:coconut_3"})
			count = count + 1
			if count == 4 then
				break
			end
		end
	end,
})

-- Register coconuts, and make them regrow

local coconut_growfn = function(pos, elapsed)
	local node = minetest.get_node(pos)
	local delay = moretrees.coconut_grow_interval
	if not node then
		return
	elseif not moretrees.coconuts_regrow then
		-- Regrowing has been turned off. Make coconust grow instantly
		minetest.swap_node(pos, {name="moretrees:coconut_3"})
		return
	elseif node.name == "moretrees:coconut_3" then
		-- Drop coconuts (i.e. remove them), so that new coconuts can grow.
		-- Coconuts will drop as items with a small chance
		if math.random(coconut_drop_ichance) == 1 then
			if moretrees.coconut_item_drop_ichance > 0
				and math.random(moretrees.coconut_item_drop_ichance) == 1 then
				local items = minetest.get_node_drops(minetest.get_node(pos).name)
				for _, itemname in pairs(items) do
					minetest.add_item(pos, itemname)
				end
			end
			minetest.swap_node(pos, {name = "air"})
		end
	else
		-- Grow coconuts to the next stage
		local offset = string.len("moretrees:coconut_x")
		local n = string.sub(node.name, offset)
		minetest.swap_node(pos, {name=string.sub(node.name, 1, offset-1)..n+1})
	end
	-- Don't catch up when elapsed time is large. Regular visits are needed for growth...
	local timer = minetest.get_node_timer(pos)
	timer:start(delay + math.random(moretrees.coconut_grow_interval))
end

local coconut_starttimer = function(pos, elapsed)
	local timer = minetest.get_node_timer(pos)
	local base_interval = moretrees.coconut_grow_interval * 2 / 3
	timer:set(base_interval + math.random(base_interval), elapsed or 0)
end

for _,suffix in ipairs({"_0", "_1", "_2", "_3", ""}) do
	local name
	if suffix == "_0" then
		name = S("Coconut Flower")
	else
		name = S("Coconut")
	end
	local drop = ""
	local coco_group = 1
	local tile = "moretrees_coconut"..suffix..".png"
	local timerfn = coconut_growfn
	local constructfn = coconut_starttimer
	if suffix == "_3" then
		drop = "moretrees:coconut"
		tile = "moretrees_coconut.png"
	elseif suffix == "" then
		drop = nil
		coco_group = nil
		timerfn = nil
		constructfn = nil
	end
	local coconutdef = {
		description = name,
		tiles = {tile},
		drawtype = "plantlike",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		groups = { fleshy=3, dig_immediate=3, flammable=2, moretrees_coconut=coco_group },
		inventory_image = tile.."^[transformR180",
		wield_image = tile.."^[transformR180",
		sounds = default.node_sound_defaults(),
		drop = drop,
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.3, -0.3, 0.3, 0.3, 0.3}
		},
		on_timer = timerfn,
		on_construct = constructfn,

	}
	minetest.register_node("moretrees:coconut"..suffix, coconutdef)
end
