#@s=ore about to spawn a tree
#ran from ore_trees:run/count

#runs the correct tree spawn for the ore
execute if entity @s[nbt={Item:{id:"minecraft:gold_ore"}}] run tag @s add gm4_ore_trees_world_ore
execute if entity @s[nbt={Item:{id:"minecraft:iron_ore"}}] run tag @s add gm4_ore_trees_world_ore
execute if entity @s[nbt={Item:{id:"minecraft:coal_ore"}}] run tag @s add gm4_ore_trees_world_ore
execute if entity @s[nbt={Item:{id:"minecraft:lapis_ore"}}] run tag @s add gm4_ore_trees_world_ore
execute if entity @s[nbt={Item:{id:"minecraft:diamond_ore"}}] run tag @s add gm4_ore_trees_world_ore
execute if entity @s[nbt={Item:{id:"minecraft:redstone_ore"}}] run tag @s add gm4_ore_trees_world_ore
execute if entity @s[nbt={Item:{id:"minecraft:emerald_ore"}}] run tag @s add gm4_ore_trees_world_ore
#tests for overworld ore type and displays particle above
execute if entity @s[nbt={Item:{id:"minecraft:nether_quartz_ore"}}] run tag @s add gm4_ore_trees_nether_ore

#puts the basic tree in place
execute if entity @s[tag=gm4_ore_trees_world_ore] positioned ~ ~4 ~ run function ore_trees:spawn_tree/world_base
execute if entity @s[tag=gm4_ore_trees_nether_ore] positioned ~ ~4 ~ run function ore_trees:spawn_tree/nether_base

#kills items
kill @e[distance=..1,tag=gm4_ore_trees_valid_sapling,limit=1]
kill @s