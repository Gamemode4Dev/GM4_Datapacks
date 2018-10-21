#@s = @e[tag=gm4_ore_trees_valid_sapling] in water
#runs from ore_trees:main

#stops item from despawning
data merge entity @s {Age:1s}

#tests if there is an overworld ore nearby and if the block above is an overworld growable block
execute as @e[limit=1,type=item,distance=..1,nbt={Item:{id:"minecraft:gold_ore",Count:1b}}] at @s if block ~ ~1 ~ #ore_trees:gm4_ore_trees_world_block if block ~ ~-1 ~ #ore_trees:gm4_ore_trees_world_block run function ore_trees:run/count
execute as @e[limit=1,type=item,distance=..1,nbt={Item:{id:"minecraft:iron_ore",Count:1b}}] at @s if block ~ ~1 ~ #ore_trees:gm4_ore_trees_world_block if block ~ ~-1 ~ #ore_trees:gm4_ore_trees_world_block run function ore_trees:run/count
execute as @e[limit=1,type=item,distance=..1,nbt={Item:{id:"minecraft:coal_ore",Count:1b}}] at @s if block ~ ~1 ~ #ore_trees:gm4_ore_trees_world_block if block ~ ~-1 ~ #ore_trees:gm4_ore_trees_world_block run function ore_trees:run/count
execute as @e[limit=1,type=item,distance=..1,nbt={Item:{id:"minecraft:lapis_ore",Count:1b}}] at @s if block ~ ~1 ~ #ore_trees:gm4_ore_trees_world_block if block ~ ~-1 ~ #ore_trees:gm4_ore_trees_world_block run function ore_trees:run/count
execute as @e[limit=1,type=item,distance=..1,nbt={Item:{id:"minecraft:diamond_ore",Count:1b}}] at @s if block ~ ~1 ~ #ore_trees:gm4_ore_trees_world_block if block ~ ~-1 ~ #ore_trees:gm4_ore_trees_world_block run function ore_trees:run/count
execute as @e[limit=1,type=item,distance=..1,nbt={Item:{id:"minecraft:redstone_ore",Count:1b}}] at @s if block ~ ~1 ~ #ore_trees:gm4_ore_trees_world_block if block ~ ~-1 ~ #ore_trees:gm4_ore_trees_world_block run function ore_trees:run/count
execute as @e[limit=1,type=item,distance=..1,nbt={Item:{id:"minecraft:emerald_ore",Count:1b}}] at @s if block ~ ~1 ~ #ore_trees:gm4_ore_trees_world_block if block ~ ~-1 ~ #ore_trees:gm4_ore_trees_world_block run function ore_trees:run/count
#tests if there is a nether ore nearby and if the block above is a nether growable block
execute as @e[limit=1,type=item,distance=..1,nbt={Item:{id:"minecraft:nether_quartz_ore",Count:1b}}] at @s if block ~ ~1 ~ #ore_trees:gm4_ore_trees_nether_block if block ~ ~-1 ~ #ore_trees:gm4_ore_trees_nether_block run function ore_trees:run/count