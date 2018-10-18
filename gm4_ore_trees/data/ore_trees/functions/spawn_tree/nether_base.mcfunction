#@s = 4 blocks above the item spawning the tree
#rans from ore_trees/run/get_tree

#does the base tree structure
setblock ~ ~ ~ structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Scommander_",rotation:"NONE",posX:-2,mode:"LOAD",posY:0,sizeX:5,posZ:-2,integrity:1.0f,showair:0b,name:"ore_trees:base_nether_tree_1",sizeY:4,sizeZ:5,showboundingbox:1b}
setblock ~ ~1 ~ redstone_block
#fills the log
fill ~ ~-2 ~ ~ ~2 ~ magma_block
#turns water to lava
setblock ~ ~-4 ~ lava

#summons randomizer AEC's
summon area_effect_cloud ~ ~-2 ~ {Tags:["gm4_ore_trees_rand_ore"],CustomName:"{\"text\":\"gm4_ore_trees_rand_ore\"}"}
summon area_effect_cloud ~ ~-1 ~ {Tags:["gm4_ore_trees_rand_ore"],CustomName:"{\"text\":\"gm4_ore_trees_rand_ore\"}"}
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_ore_trees_rand_ore"],CustomName:"{\"text\":\"gm4_ore_trees_rand_ore\"}"}
summon area_effect_cloud ~ ~1 ~ {Tags:["gm4_ore_trees_rand_ore"],CustomName:"{\"text\":\"gm4_ore_trees_rand_ore\"}"}
summon area_effect_cloud ~ ~2 ~ {Tags:["gm4_ore_trees_rand_ore"],CustomName:"{\"text\":\"gm4_ore_trees_rand_ore\"}"}

#tests which ore it is
execute if entity @s[nbt={Item:{id:"minecraft:nether_quartz_ore"}}] run function ore_trees:spawn_tree/nether_quartz_ore

#kills randomizers
kill @e[tag=gm4_ore_trees_rand_ore,distance=..10]