-- More trees!  2013-04-07
--
-- This mod adds more types of trees to the game
--
-- Some of the node definitions and textures came from cisoun's conifers mod 
-- and bas080's jungle trees mod.
--
-- Brought together into one mod and made L-systems compatible by Vanessa
-- Ezekowitz.
--
-- Firs and Jungle tree axioms/rules by Vanessa Ezekowitz, with the 
-- latter having been tweaked by RealBadAngel, most other axioms/rules written
-- by RealBadAngel.
--
-- License: WTFPL for all parts (code and textures, including those copied
-- from the jungletree and conifers mods) except the default jungle tree trunk
-- texture, which is CC-By-SA.

moretrees = {}

-- If the config file is not found in the world directory, copy the default
-- settings to that location and read them in.

local worldpath=minetest.get_worldpath()
local modpath=minetest.get_modpath("moretrees")

if io.open(worldpath.."/moretrees_settings.txt","r") == nil then

	dofile(modpath.."/default_settings.txt")

	io.input(modpath.."/default_settings.txt")
	io.output(worldpath.."/moretrees_settings.txt")

	local size = 2^13      -- good buffer size (8K)
	while true do
		local block = io.read(size)
		if not block then break end
		io.write(block)
	end
end

dofile(worldpath.."/moretrees_settings.txt")

dofile(modpath.."/tree_models.lua")
dofile(modpath.."/biome_defs.lua")
dofile(modpath.."/node_defs.lua")
dofile(modpath.."/saplings.lua")
dofile(modpath.."/crafts.lua")
dofile(modpath.."/leafdecay.lua")

-- tree spawning setup

if moretrees.enable_beech then
	plantslib:register_generate_plant(moretrees.beech_biome, moretrees.beech_model)
end

if moretrees.enable_apple_tree then
	plantslib:register_generate_plant(moretrees.apple_tree_biome, moretrees.apple_tree_model)
end

if moretrees.enable_oak then
	plantslib:register_generate_plant(moretrees.oak_biome, moretrees.oak_model)
end

if moretrees.enable_sequoia then
	plantslib:register_generate_plant(moretrees.sequoia_biome, moretrees.sequoia_model)
end

if moretrees.enable_palm then
	plantslib:register_generate_plant(moretrees.palm_biome, moretrees.palm_model)
end

if moretrees.enable_pine then
	plantslib:register_generate_plant(moretrees.pine_biome, moretrees.pine_model)
end

if moretrees.enable_rubber_tree then
	plantslib:register_generate_plant(moretrees.rubber_tree_biome, moretrees.rubber_tree_model)
end

if moretrees.enable_willow then
	plantslib:register_generate_plant(moretrees.willow_biome, moretrees.willow_model)
end

if moretrees.enable_birch then
	plantslib:register_generate_plant(moretrees.birch_biome, "moretrees:grow_birch")
end

if moretrees.enable_spruce then
	plantslib:register_generate_plant(moretrees.spruce_biome, "moretrees:grow_spruce")
end

if moretrees.enable_jungle_tree then
	plantslib:register_generate_plant(moretrees.jungletree_biome, "moretrees:grow_jungletree")
end

if moretrees.enable_fir then
	plantslib:register_generate_plant(moretrees.fir_biome, "moretrees:grow_fir")
	plantslib:register_generate_plant(moretrees.fir_biome_snow, "moretrees:grow_fir_snow")
end

-- Code to spawn a birch tree

function moretrees:grow_birch(pos)
	minetest.env:remove_node(pos)
	if math.random(1,2) == 1 then
		minetest.env:spawn_tree(pos, moretrees.birch_model1)
	else
		minetest.env:spawn_tree(pos, moretrees.birch_model2)
	end
end

-- Code to spawn a spruce tree

function moretrees:grow_spruce(pos)
	minetest.env:remove_node(pos)
	if math.random(1,2) == 1 then
		minetest.env:spawn_tree(pos, moretrees.spruce_model1)
	else
		minetest.env:spawn_tree(pos, moretrees.spruce_model2)
	end
end

-- Code to spawn jungle trees

moretrees.jt_axiom1 = "FFFA"
moretrees.jt_rules_a1 = "FFF[&&-FBf[&&&Ff]^^^Ff][&&+FBFf[&&&FFf]^^^Ff][&&---FBFf[&&&Ff]^^^Ff][&&+++FBFf[&&&Ff]^^^Ff]F/A"
moretrees.jt_rules_b1 = "[-Ff&f][+Ff&f]B"

moretrees.jt_axiom2 = "FFFFFA"
moretrees.jt_rules_a2 = "FFFFF[&&-FFFBF[&&&FFff]^^^FFf][&&+FFFBFF[&&&FFff]^^^FFf][&&---FFFBFF[&&&FFff]^^^FFf][&&+++FFFBFF[&&&FFff]^^^FFf]FF/A"
moretrees.jt_rules_b2 = "[-FFf&ff][+FFf&ff]B"

moretrees.ct_rules_a1 = "FF[FF][&&-FBF][&&+FBF][&&---FBF][&&+++FBF]F/A"
moretrees.ct_rules_b1 = "[-FBf][+FBf]"

moretrees.ct_rules_a2 = "FF[FF][&&-FBF][&&+FBF][&&---FBF][&&+++FBF]F/A"
moretrees.ct_rules_b2 = "[-fB][+fB]"

function moretrees:grow_jungletree(pos)
	local r1 = math.random(2)
	local r2 = math.random(3)
	if r1 == 1 then
		moretrees.jungletree_model.leaves2 = "moretrees:jungletree_leaves_red"
	else 
		moretrees.jungletree_model.leaves2 = "moretrees:jungletree_leaves_yellow"
	end
	moretrees.jungletree_model.leaves2_chance = math.random(25, 75)

	if r2 == 1 then
		moretrees.jungletree_model.trunk_type = "single"
		moretrees.jungletree_model.iterations = 2
		moretrees.jungletree_model.axiom = moretrees.jt_axiom1
		moretrees.jungletree_model.rules_a = moretrees.jt_rules_a1
		moretrees.jungletree_model.rules_b = moretrees.jt_rules_b1
	elseif r2 == 2 then
		moretrees.jungletree_model.trunk_type = "double"
		moretrees.jungletree_model.iterations = 4
		moretrees.jungletree_model.axiom = moretrees.jt_axiom2
		moretrees.jungletree_model.rules_a = moretrees.jt_rules_a2
		moretrees.jungletree_model.rules_b = moretrees.jt_rules_b2
	elseif r2 == 3 then
		moretrees.jungletree_model.trunk_type = "crossed"
		moretrees.jungletree_model.iterations = 4
		moretrees.jungletree_model.axiom = moretrees.jt_axiom2
		moretrees.jungletree_model.rules_a = moretrees.jt_rules_a2
		moretrees.jungletree_model.rules_b = moretrees.jt_rules_b2
	end

	minetest.env:remove_node(pos)
	local leaves = minetest.env:find_nodes_in_area({x = pos.x-1, y = pos.y, z = pos.z-1}, {x = pos.x+1, y = pos.y+10, z = pos.z+1}, "default:leaves")
	for leaf in ipairs(leaves) do
			minetest.env:remove_node(leaves[leaf])
	end
	minetest.env:spawn_tree(pos, moretrees.jungletree_model)
end

-- code to spawn fir trees

function moretrees:grow_fir(pos)
	if math.random(2) == 1 then
		moretrees.fir_model.leaves="moretrees:fir_leaves"
	else
		moretrees.fir_model.leaves="moretrees:fir_leaves_bright"
	end
	if math.random(2) == 1 then
		moretrees.fir_model.rules_a = moretrees.ct_rules_a1
		moretrees.fir_model.rules_b = moretrees.ct_rules_b1
	else
		moretrees.fir_model.rules_a = moretrees.ct_rules_a2
		moretrees.fir_model.rules_b = moretrees.ct_rules_b2
	end

	moretrees.fir_model.iterations = 7
	moretrees.fir_model.random_level = 5

	minetest.env:remove_node(pos)
	local leaves = minetest.env:find_nodes_in_area({x = pos.x, y = pos.y, z = pos.z}, {x = pos.x, y = pos.y+5, z = pos.z}, "default:leaves")
	for leaf in ipairs(leaves) do
			minetest.env:remove_node(leaves[leaf])
	end
	minetest.env:spawn_tree(pos,moretrees.fir_model)
end

-- same thing, but a smaller version that grows only in snow biomes

function moretrees:grow_fir_snow(pos)
	if math.random(2) == 1 then
		moretrees.fir_model.leaves="moretrees:fir_leaves"
	else
		moretrees.fir_model.leaves="moretrees:fir_leaves_bright"
	end
	if math.random(2) == 1 then
		moretrees.fir_model.rules_a = moretrees.ct_rules_a1
		moretrees.fir_model.rules_b = moretrees.ct_rules_b1
	else
		moretrees.fir_model.rules_a = moretrees.ct_rules_a2
		moretrees.fir_model.rules_b = moretrees.ct_rules_b2
	end

	moretrees.fir_model.iterations = 2
	moretrees.fir_model.random_level = 2

	minetest.env:remove_node(pos)
	local leaves = minetest.env:find_nodes_in_area({x = pos.x, y = pos.y, z = pos.z}, {x = pos.x, y = pos.y+5, z = pos.z}, "default:leaves")
	for leaf in ipairs(leaves) do
			minetest.env:remove_node(leaves[leaf])
	end
	minetest.env:spawn_tree(pos,moretrees.fir_model)
end

print("[Moretrees] Loaded (2013-02-11)")
