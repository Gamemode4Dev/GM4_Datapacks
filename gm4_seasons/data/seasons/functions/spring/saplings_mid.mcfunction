#run from seasons:spring/tick


execute if entity @a[scores={gm4_szn_leaf_o=1..}] run scoreboard players set #gm4_maxrand gm4_szn_rng 5
execute if entity @a[scores={gm4_szn_leaf_o=1..}] run function seasons:rng/nextrand

execute if entity @a[scores={gm4_szn_leaf_b=1..}] run scoreboard players set #gm4_maxrand gm4_szn_rng 5
execute if entity @a[scores={gm4_szn_leaf_b=1..}] run function seasons:rng/nextrand

execute if entity @a[scores={gm4_szn_leaf_d=1..}] run scoreboard players set #gm4_maxrand gm4_szn_rng 5
execute if entity @a[scores={gm4_szn_leaf_d=1..}] run function seasons:rng/nextrand

execute if entity @a[scores={gm4_szn_leaf_j=1..}] run scoreboard players set #gm4_maxrand gm4_szn_rng 5
execute if entity @a[scores={gm4_szn_leaf_j=1..}] run function seasons:rng/nextrand


execute if entity @a[scores={gm4_szn_leaf_o=1..}] if score #gm4_randval gm4_szn_rng matches 1 at @a[scores={gm4_szn_leaf_o=1..}] if entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:oak_sapling",Count:1b}},distance=..7] run data merge entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:oak_sapling",Count:1b}},limit=1,distance=..7] {Item:{Count:2b}}

execute if entity @a[scores={gm4_szn_leaf_b=1..}] if score #gm4_randval gm4_szn_rng matches 1 at @a[scores={gm4_szn_leaf_b=1..}] if entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:birch_sapling",Count:1b}},distance=..7] run data merge entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:birch_sapling",Count:1b}},limit=1,distance=..7] {Item:{Count:2b}}

execute if entity @a[scores={gm4_szn_leaf_d=1..}] if score #gm4_randval gm4_szn_rng matches 1 at @a[scores={gm4_szn_leaf_d=1..}] if entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:dark_oak_sapling",Count:1b}},distance=..7] run data merge entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:dark_oak_sapling",Count:1b}},limit=1,distance=..7] {Item:{Count:2b}}

execute if entity @a[scores={gm4_szn_leaf_j=1..}] if score #gm4_randval gm4_szn_rng matches 1 at @a[scores={gm4_szn_leaf_j=1..}] if entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:jungle_sapling",Count:1b}},distance=..7] run data merge entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:jungle_sapling",Count:1b}},limit=1,distance=..7] {Item:{Count:2b}}


tag @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:oak_sapling"}}] add gm4_szn_checked
tag @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:birch_sapling"}}] add gm4_szn_checked
tag @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:dark_oak_sapling"}}] add gm4_szn_checked
tag @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:jungle_sapling"}}] add gm4_szn_checked