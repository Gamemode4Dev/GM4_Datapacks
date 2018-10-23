#run from seasons:autumn/tick

execute if entity @a[scores={gm4_szn_leaf_o=1..}] run scoreboard players set #gm4_maxrand gm4_szn_rng 10
execute if entity @a[scores={gm4_szn_leaf_o=1..}] run function seasons:rng/nextrand

execute if entity @a[scores={gm4_szn_leaf_b=1..}] run scoreboard players set #gm4_maxrand gm4_szn_rng 10
execute if entity @a[scores={gm4_szn_leaf_b=1..}] run function seasons:rng/nextrand

execute if entity @a[scores={gm4_szn_leaf_d=1..}] run scoreboard players set #gm4_maxrand gm4_szn_rng 10
execute if entity @a[scores={gm4_szn_leaf_d=1..}] run function seasons:rng/nextrand



execute if entity @a[scores={gm4_szn_leaf_o=1..}] if score #gm4_randval gm4_szn_rng matches 0..2 at @a[scores={gm4_szn_leaf_o=1..}] if entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:oak_leaves",Count:1b}},distance=..7] run data merge entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:oak_leaves",Count:1b}},limit=1,distance=..7] {Tags:[gm4_szn_stick],Item:{id:"minecraft:stick",Count:1b}}


execute if entity @a[scores={gm4_szn_leaf_b=1..}] if score #gm4_randval gm4_szn_rng matches 0..2 at @a[scores={gm4_szn_leaf_b=1..}] if entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:birch_leaves",Count:1b}},distance=..7] run data merge entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:birch_leaves",Count:1b}},limit=1,distance=..7] {Tags:[gm4_szn_stick],Item:{id:"minecraft:stick",Item:{Count:1b}}


execute if entity @a[scores={gm4_szn_leaf_d=1..}] if score #gm4_randval gm4_szn_rng matches 0..2 at @a[scores={gm4_szn_leaf_d=1..}] if entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:dark_oak_leaves",Count:1b}},distance=..7] run data merge entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:dark_oak_leaves",Count:1b}},limit=1,distance=..7] {Tags:[gm4_szn_stick],Item:{id:"minecraft:stick",Item:{Count:1b}}



execute if entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:oak_leaves"}}] run tag @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:oak_leaves"}}] add gm4_szn_checked
execute if entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:birch_leaves"}}] run tag @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:birch_leaves"}}] add gm4_szn_checked
execute if entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:dark_oak_leaves"}}] run tag @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:dark_oak_leaves"}}] add gm4_szn_checked