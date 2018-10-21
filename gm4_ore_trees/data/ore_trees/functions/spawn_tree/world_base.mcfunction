#@s = 4 blocks above the item spawning the tree
#runs from ore_trees/run/get_tree

#does the base tree structure
setblock ~ ~ ~ structure_block[mode=load]{metadata:"",mirror:"NONE",ignoreEntities:1b,powered:0b,seed:0L,author:"Scommander_",rotation:"NONE",posX:-2,mode:"LOAD",posY:0,sizeX:5,posZ:-2,integrity:1.0f,showair:0b,name:"ore_trees:base_world_tree_1",sizeY:4,sizeZ:5,showboundingbox:1b}
setblock ~ ~1 ~ redstone_block
#fills the log
fill ~ ~-2 ~ ~ ~2 ~ stone
#turns water to mossy cobblestone
setblock ~ ~-4 ~ mossy_cobblestone

#summons randomizer AEC's
summon area_effect_cloud ~ ~-2 ~ {Tags:["gm4_ore_trees_rand_ore"],CustomName:"{\"text\":\"gm4_ore_trees_rand_ore\"}"}
summon area_effect_cloud ~ ~-1 ~ {Tags:["gm4_ore_trees_rand_ore"],CustomName:"{\"text\":\"gm4_ore_trees_rand_ore\"}"}
summon area_effect_cloud ~ ~ ~ {Tags:["gm4_ore_trees_rand_ore"],CustomName:"{\"text\":\"gm4_ore_trees_rand_ore\"}"}
summon area_effect_cloud ~ ~1 ~ {Tags:["gm4_ore_trees_rand_ore"],CustomName:"{\"text\":\"gm4_ore_trees_rand_ore\"}"}
summon area_effect_cloud ~ ~2 ~ {Tags:["gm4_ore_trees_rand_ore"],CustomName:"{\"text\":\"gm4_ore_trees_rand_ore\"}"}

#tests which ore it is
execute if entity @s[nbt={Item:{id:"minecraft:gold_ore"}}] run function ore_trees:spawn_tree/gold_ore
execute if entity @s[nbt={Item:{id:"minecraft:iron_ore"}}] run function ore_trees:spawn_tree/iron_ore
execute if entity @s[nbt={Item:{id:"minecraft:coal_ore"}}] run function ore_trees:spawn_tree/coal_ore
execute if entity @s[nbt={Item:{id:"minecraft:lapis_ore"}}] run function ore_trees:spawn_tree/lapis_ore
execute if entity @s[nbt={Item:{id:"minecraft:diamond_ore"}}] run function ore_trees:spawn_tree/diamond_ore
execute if entity @s[nbt={Item:{id:"minecraft:redstone_ore"}}] run function ore_trees:spawn_tree/redstone_ore
execute if entity @s[nbt={Item:{id:"minecraft:emerald_ore"}}] run function ore_trees:spawn_tree/emerald_ore

#kills randomizers
kill @e[tag=gm4_ore_trees_rand_ore,distance=..10]