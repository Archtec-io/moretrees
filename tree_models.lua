moretrees.beech_model={
	axiom="FFFFFBFB",
	-- luacheck: no max line length
	rules_a="[&&&GGF[++^Fd][--&Fd]//Fd[+^Fd][--&Fd]]////[&&&GGF[++^Fd][--&Fd]//Fd[+^Fd][--&Fd]]////[&&&GGF[++^Fd][--&Fd]//Fd[+^Fd][--&Fdd]]",
	rules_b="[&&&F[++^Fd][--&d]//d[+^d][--&d]]////[&&&F[++^Fd][--&d]//d[+^d][--&d]]////[&&&F[++^Fd][--&Fd]//d[+^d][--&d]]",
	rules_c="/",
	rules_d="F",
	trunk="moretrees:beech_trunk",
	leaves="moretrees:beech_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true
}

moretrees.apple_tree_model={
	axiom="FFFFFAFFBF",
	rules_a="[&&&FFFFF&&FFFF][&&&++++FFFFF&&FFFF][&&&----FFFFF&&FFFF]",
	rules_b="[&&&++FFFFF&&FFFF][&&&--FFFFF&&FFFF][&&&------FFFFF&&FFFF]",
	trunk="moretrees:apple_tree_trunk",
	leaves="moretrees:apple_tree_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true,
	fruit=minetest.get_modpath("default") and "default:apple" or nil,
	fruit_chance=minetest.get_modpath("default") and 15 or nil,
}

moretrees.oak_model={
	axiom="FFFFFFA",
	rules_a="[&FFBFA]////[&BFFFA]////[&FBFFA]",
	rules_b="[&FFFA]////[&FFFA]////[&FFFA]",
	trunk="moretrees:oak_trunk",
	leaves="moretrees:oak_leaves",
	angle=30,
	iterations=5,
	random_level=2,
	trunk_type="crossed",
	thin_branches=false,
	fruit="moretrees:acorn",
	fruit_chance=3,
}

moretrees.poplar_model={
	axiom="TTTaaBCCCCCCCCCCCcccBBB[[f]&&G++f++Gf++Gf++Gf++G--]G[[f]&&G++f++Gf++Gf++Gf++G--]Gff",
	rules_a="T",
	rules_b="[[T]&&G++f++ff++ff++ff++f--]G",
	rules_c="[[T]&&G++f++ff++ff++ff++f--G++[d]G[d]G++G[d]G[d]G[d]G++G[d]G[d]G[d]G++G[d]G[d]G[d]G++G[d]G]G",
	rules_d="f",
	trunk="moretrees:poplar_trunk",
	leaves="moretrees:poplar_leaves",
	angle=45,
	iterations=0,
	random_level=0,
	trunk_type="single",
	thin_branches=false,
}

moretrees.poplar_small_model={
	axiom="TT[T]BCCCCccBBff",
	rules_a="T",
	rules_b="[[f]&&G++f++Gf++Gf++Gf++G--]G",
	rules_c="[[T]&&G++f++[d]Gf++[d]Gf++[d]Gf++[d]G--]G",
	rules_d="f",
	trunk="moretrees:poplar_trunk",
	leaves="moretrees:poplar_leaves",
	angle=45,
	iterations=0,
	random_level=0,
	trunk_type="single",
	thin_branches=false,
}

moretrees.sequoia_model={
	axiom="FFFFFFFFFFddccA///cccFddcFA///ddFcFA/cFFddFcdBddd/A/ccdcddd/ccAddddcFBcccAccFdFcFBcccc/BFdFFcFFdcccc/B",
	-- luacheck: no max line length
	rules_a="[&&&GGF[++^FFdd][--&Fddd]//Fdd[+^Fd][--&Fdd]]////[&&&GGF[++^FFdd][--&Fddd]//Fdd[+^Fd][--&Fdd]]////[&&&GGF[++^FFdd][--&Fddd]//Fdd[+^Fd][--&Fdd]]",
	rules_b="[&&&GGF[++^Fdd][--&Fdd]//dd[+^d][--&Fd]]////[&&&GGF[++^Fdd][--&Fdd]//dd[+^d][--&Fd]]////[&&&GGF[++^Fdd][--&Fdd]//dd[+^d][--&Fd]]",
	rules_c="/",
	rules_d="F",
	trunk="moretrees:sequoia_trunk",
	leaves="moretrees:sequoia_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="crossed",
	thin_branches=true
}

moretrees.birch_model1={
	axiom="FFFFFdddccA/FFFFFFcA/FFFFFFcB",
	rules_a="[&&&dddd^^ddddddd][&&&---dddd^^ddddddd][&&&+++dddd^^ddddddd][&&&++++++dddd^^ddddddd]",
	rules_b="[&&&ddd^^ddddd][&&&---ddd^^ddddd][&&&+++ddd^^ddddd][&&&++++++ddd^^ddddd]",
	rules_c="/",
	rules_d="F",
	trunk="moretrees:birch_trunk",
	leaves="moretrees:birch_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true
}

moretrees.birch_model2={
	axiom="FFFdddccA/FFFFFccA/FFFFFccB",
	rules_a="[&&&dFFF^^FFFdd][&&&---dFFF^^FFFdd][&&&+++dFFF^^FFFdd][&&&++++++dFFF^^FFFdd]",
	rules_b="[&&&dFF^^FFFd][&&&---dFFF^^FFFd][&&&+++dFF^^FFFd][&&&++++++dFF^^FFFd]",
	rules_c="/",
	rules_d="F",
	trunk="moretrees:birch_trunk",
	leaves="moretrees:birch_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true
}

-- Coconuts can't be generated as fruit, because there is no support for the
-- special fruit trunks that allow coconuts to regrow at the correct position
-- in the tree.
-- So, a placeholder fruit trunk is spawned. An ABM will convert it to the final
-- fruit trunk, and generate the actual coconuts.
moretrees.palm_model={
	axiom="FFcccccc&FFFFFdddRA//A//A//A//A//A",
	rules_a="[&fb&bbb[++f--&ffff&ff][--f++&ffff&ff]&ffff&bbbb&b]",
	rules_b="f",
	rules_c="/",
	rules_d="F",
	trunk="moretrees:palm_trunk",
	leaves="moretrees:palm_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true,
	fruit="moretrees:palm_fruit_trunk_gen",
	fruit_chance=0
}

-- Dates can't be generated as fruit, because there is no support for the
-- special (male and female) fruit trunks that allow dates to regrow at the
-- correct position in the tree.
-- So, a generic fruit trunk is spawned. An ABM will convert it to a male
-- or female fruit trunk, and generate the actual dates.
moretrees.date_palm_model={
	axiom="TTTTddddddddddccccccccccRT[TTT]"..
		"ccccc[&&a]ccccc[&&a]ccccc[&&a]ccccc[&&a]ccccc[&&a]ccccc[&&a]"..
		"GGccccc[&a]ccccc[&a]ccccc[&a]ccccc[&a]ccccc[&a]ccccc[&a]"..
		"GGccccc[a]ccccc[a]ccccc[a]ccccc[a]ccccc[a]ccccc[a]",
	rules_a="Gffb&bbb[++f--&ffff&ff][--f++&ffff&ff]&ff&ff&bb&bb&bb",
	rules_b="f",
	rules_c="/",
	rules_d="F",
	trunk="moretrees:date_palm_trunk",
	leaves="moretrees:date_palm_leaves",
	angle=18,
	iterations=1,
	random_level=0,
	trunk_type="single",
	thin_branches=false,
	fruit="moretrees:date_palm_fruit_trunk",
	fruit_chance=0
}

moretrees.spruce_model1={
	-- luacheck: no max line length
	axiom="FFFFFAFFFFFFBFFFFFFCFFFFFFDFFFFFF[&&&F^^FF][&&&++F^^FF][&&&++++F^^FF][&&&++++++F^^FF][&&&--F^^FF][&&&----F^^FF][FFFFf]",
	rules_a="[&&&FFFFFF^^FFF][&&&++FFFFFF^^FFF][&&&++++FFFFFF^^FFF][&&&++++++FFFFFF^^FFF][&&&--FFFFFF^^FFF][&&&----FFFFFF^^FFF]",
	rules_b="[&&&FFFFF^^FFF][&&&++FFFFF^^FFF][&&&++++FFFFF^^FFF][&&&++++++FFFFF^^FFF][&&&--FFFFF^^FFF][&&&----FFFFF^^FFF]",
	rules_c="[&&&FFFF^^FFF][&&&++FFFF^^FFF][&&&++++FFFF^^FFF][&&&++++++FFFF^^FFF][&&&--FFFF^^FFF][&&&----FFFF^^FFF]",
	rules_d="[&&&FFF^^FFF][&&&++FFF^^FFF][&&&++++FFF^^FFF][&&&++++++FFF^^FFF][&&&--FFF^^FFF][&&&----FFF^^FFF]",
	trunk="moretrees:spruce_trunk",
	leaves="moretrees:spruce_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="crossed",
	thin_branches=true,
	fruit="moretrees:spruce_cone",
	fruit_chance=8
}

moretrees.spruce_model2={
	-- luacheck: no max line length
	axiom="FFFFFFBFFFFFFCFFFFFFDFFFFFF[&&&F^^FF][&&&++F^^FF][&&&++++F^^FF][&&&++++++F^^FF][&&&--F^^FF][&&&----F^^FF][FFFFf]",
	rules_b="[&&&FFFFF^^FFF][&&&++FFFFF^^FFF][&&&++++FFFFF^^FFF][&&&++++++FFFFF^^FFF][&&&--FFFFF^^FFF][&&&----FFFFF^^FFF]",
	rules_c="[&&&FFFF^^FFF][&&&++FFFF^^FFF][&&&++++FFFF^^FFF][&&&++++++FFFF^^FFF][&&&--FFFF^^FFF][&&&----FFFF^^FFF]",
	rules_d="[&&&FFF^^FFF][&&&++FFF^^FFF][&&&++++FFF^^FFF][&&&++++++FFF^^FFF][&&&--FFF^^FFF][&&&----FFF^^FFF]",
	trunk="moretrees:spruce_trunk",
	leaves="moretrees:spruce_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="crossed",
	thin_branches=true,
	fruit="moretrees:spruce_cone",
	fruit_chance=8
}

moretrees.cedar_model={
	axiom="FFFFFcccdddB///cFdFB////cFdFB///cFdFB///cFdFA///cFdFA///cFdFB[FF]f",
	rules_a="[&&&TTTT[++^TFdd][--&TFd]//Tdd[+^Fd][--&Fdd]]",
	rules_b="[&&&TTT[++^Fdd][--&Fdd]//dd[+^d][--&Fd]]",
	rules_c="/",
	rules_d="F",
	trunk="moretrees:cedar_trunk",
	leaves="moretrees:cedar_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true,
	fruit="moretrees:cedar_cone",
	fruit_chance=8
}

moretrees.willow_model={
	axiom="FFFFFFFFccA",
	-- luacheck: no max line length
	rules_a="[&FF&FFFF&&F&FFFFFFFdddd][**&FF&FFFF&&F&FFFFFFFdddd][//&FF&FFFF&&F&FFFFFFFdddd][////&FF&FFFF&&F&FFFFFFFdddd][//////&FF&FFFF&&F&FFFFFFFdddd][////////&FF&FFFF&&F&FFFFFFFdddd]",
	rules_c="/",
	rules_d="F",
	trunk="moretrees:willow_trunk",
	leaves="moretrees:willow_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="crossed",
	thin_branches=true
}

moretrees.rubber_tree_model={
	axiom="FFFFA",
	rules_a="[&FFBFA]////[&BFFFA]////[&FBFFA]",
	rules_b="[&FFA]////[&FFA]////[&FFA]",
	trunk="moretrees:rubber_tree_trunk",
	leaves="moretrees:rubber_tree_leaves",
	angle=35,
	iterations=3,
	random_level=1,
	trunk_type="double",
	thin_branches=true
}

moretrees.jungletree_model={
	axiom=nil,
	rules_a=nil,
	rules_b=nil,
	trunk="moretrees:jungletree_trunk",
	leaves=xcompat.materials.jungle_leaves,
	leaves2=nil,
	leaves2_chance=nil,
	angle=45,
	iterations=nil,
	random_level=2,
	trunk_type=nil,
	thin_branches=true,
	fruit_chance=15,
	fruit="vines:vine"
}

moretrees.fir_model={
	axiom="FFFAF[&&-F][&&+F][&&---F][&&+++F]Fff",
	rules_a=nil,
	rules_b=nil,
	trunk="moretrees:fir_trunk",
	leaves=nil,
	angle=45,
	iterations=7,
	random_level=5,
	trunk_type="single",
	thin_branches=true,
	fruit="moretrees:fir_cone",
	fruit_chance=8
}
