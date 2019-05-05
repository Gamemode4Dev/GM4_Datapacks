#@s = not tipped skeletons with nbt={HandItems:[{id:"minecraft:bow",Count:1b},{}],PersistenceRequired:0b}
#at @s
#called by event
tag @s add gm4_tipped_skeleton
scoreboard players add @s gm4_tipped_type 0
execute if block ~ 2 ~ bedrock run scoreboard players add @s gm4_tipped_type 1
execute if block ~ 3 ~ bedrock run scoreboard players add @s gm4_tipped_type 2

#equip with tipped arrows
execute if score @s gm4_tipped_type matches 0 run data merge entity @s {HandItems:[{id:bow,Count:1},{id:tipped_arrow,Count:9b,tag:{Potion:long_slowness}}],HandDropChances:[0.085f,0.5f]}
execute if score @s gm4_tipped_type matches 1 run data merge entity @s {HandItems:[{id:bow,Count:1},{id:tipped_arrow,Count:9b,tag:{Potion:long_weakness}}],HandDropChances:[0.085f,0.5f]}
execute if score @s gm4_tipped_type matches 2 run data merge entity @s {HandItems:[{id:bow,Count:1},{id:tipped_arrow,Count:9b,tag:{Potion:long_poison}}],HandDropChances:[0.085f,0.875f]}
execute if score @s gm4_tipped_type matches 3 run data merge entity @s {HandItems:[{id:bow,Count:1},{id:tipped_arrow,Count:9b,tag:{Potion:strong_harming}}],HandDropChances:[0.085f,0.75f]}
