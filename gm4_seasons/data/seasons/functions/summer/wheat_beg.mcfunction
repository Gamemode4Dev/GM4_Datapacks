#run from seasons:summer/tick


execute if entity @a[scores={gm4_szn_mine_wheat=1..}] run scoreboard players set #gm4_maxrand gm4_szn_rng 10
execute if entity @a[scores={gm4_szn_mine_wheat=1..}] run function seasons:rng/nextrand

execute if entity @a[scores={gm4_szn_mine_wheat=1..}] if score #gm4_randval gm4_szn_rng matches 0..2 at @a[scores={gm4_szn_mine_wheat=1..}] if entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:wheat",Count:1b}},distance=..7] run data merge entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:wheat",Count:1b}},limit=1,distance=..7] {Item:{Count:2b}}
execute if entity @a[scores={gm4_szn_mine_wheat=1..}] if score #gm4_randval gm4_szn_rng matches 3 at @a[scores={gm4_szn_mine_wheat=1..}] if entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:wheat",Count:1b}},distance=..7] run data merge entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:wheat",Count:1b}},limit=1,distance=..7] {Item:{Count:3b}}

execute if entity @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:wheat"}}] run tag @e[type=item,tag=!gm4_szn_checked,nbt={Item:{id:"minecraft:wheat"}}] add gm4_szn_checked