# begins a scan downward breaking floating ladders as it goes
# @s = ladder item that was broken by player
# align xyz positioned ~.5 ~-1 ~.5
# run from gm4_rope_ladders:player/broke_ladder

# set ladder drop mode
execute unless block ~ ~2 ~ ladder run scoreboard players set $rope_drop_mode gm4_rol_data 1
execute if block ~ ~2 ~ ladder run scoreboard players set $rope_drop_mode gm4_rol_data 2

# set ladder direction
scoreboard players set $rope_drop_direction gm4_rol_data 0
execute if block ~ ~ ~ ladder[facing=south] run scoreboard players set $rope_drop_direction gm4_rol_data 1
execute if block ~ ~ ~ ladder[facing=north] run scoreboard players set $rope_drop_direction gm4_rol_data 2
execute if block ~ ~ ~ ladder[facing=east] run scoreboard players set $rope_drop_direction gm4_rol_data 3
execute if block ~ ~ ~ ladder[facing=west] run scoreboard players set $rope_drop_direction gm4_rol_data 4

# check for valid ladder placement location
scoreboard players set $loop gm4_rol_data 0
execute anchored eyes run function gm4_rope_ladders:mechanics/break_floating_ladders/scan_column/loop

# teleport all ladder items to top
execute if score $rope_drop_mode gm4_rol_data matches 1 if score $rope_drop_direction gm4_rol_data matches 1 if block ~ ~2 ~-1 #gm4_rope_ladders:valid_replace run tp @e[type=item,distance=..64,nbt={Item:{id:"minecraft:ladder"},Age:0s}] ~ ~2 ~-1
execute if score $rope_drop_mode gm4_rol_data matches 1 if score $rope_drop_direction gm4_rol_data matches 2 if block ~ ~2 ~1 #gm4_rope_ladders:valid_replace run tp @e[type=item,distance=..64,nbt={Item:{id:"minecraft:ladder"},Age:0s}] ~ ~2 ~1
execute if score $rope_drop_mode gm4_rol_data matches 1 if score $rope_drop_direction gm4_rol_data matches 3 if block ~-1 ~2 ~ #gm4_rope_ladders:valid_replace run tp @e[type=item,distance=..64,nbt={Item:{id:"minecraft:ladder"},Age:0s}] ~-1 ~2 ~
execute if score $rope_drop_mode gm4_rol_data matches 1 if score $rope_drop_direction gm4_rol_data matches 4 if block ~1 ~2 ~ #gm4_rope_ladders:valid_replace run tp @e[type=item,distance=..64,nbt={Item:{id:"minecraft:ladder"},Age:0s}] ~1 ~2 ~
execute if score $rope_drop_mode gm4_rol_data matches 1 if score $rope_drop_direction gm4_rol_data matches 1..4 as @e[type=item,distance=..64,nbt={Item:{id:"minecraft:ladder"},Age:0s}] run data modify entity @s Motion set value []
