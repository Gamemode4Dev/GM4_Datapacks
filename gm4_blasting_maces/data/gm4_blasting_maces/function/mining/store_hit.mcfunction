# Records the hit block and which face was hit
# @s = player
# at the point the ray hit, inside the solid block, with the player's rotation
# run from gm4_blasting_maces:mining/raycast

scoreboard players set $hit gm4_blast_data 1

# marker at the centre of the hit block
execute align xyz positioned ~.5 ~.5 ~.5 run summon minecraft:marker ~ ~ ~ {Tags:["gm4_blast_origin","smithed.entity","smithed.strict"]}

# marker on the cell the ray entered through
execute positioned ^ ^ ^-0.1 align xyz positioned ~.5 ~.5 ~.5 run summon minecraft:marker ~ ~ ~ {Tags:["gm4_blast_entry","smithed.entity","smithed.strict"]}

# face axis from the side the entry cell sits on (1 X, 2 Y, 3 Z)
execute at @e[type=marker,tag=gm4_blast_origin,limit=1] positioned ~1 ~ ~ if entity @e[type=marker,tag=gm4_blast_entry,distance=..0.5] run scoreboard players set $face_axis gm4_blast_data 1
execute at @e[type=marker,tag=gm4_blast_origin,limit=1] positioned ~-1 ~ ~ if entity @e[type=marker,tag=gm4_blast_entry,distance=..0.5] run scoreboard players set $face_axis gm4_blast_data 1
execute at @e[type=marker,tag=gm4_blast_origin,limit=1] positioned ~ ~1 ~ if entity @e[type=marker,tag=gm4_blast_entry,distance=..0.5] run scoreboard players set $face_axis gm4_blast_data 2
execute at @e[type=marker,tag=gm4_blast_origin,limit=1] positioned ~ ~-1 ~ if entity @e[type=marker,tag=gm4_blast_entry,distance=..0.5] run scoreboard players set $face_axis gm4_blast_data 2
execute at @e[type=marker,tag=gm4_blast_origin,limit=1] positioned ~ ~ ~1 if entity @e[type=marker,tag=gm4_blast_entry,distance=..0.5] run scoreboard players set $face_axis gm4_blast_data 3
execute at @e[type=marker,tag=gm4_blast_origin,limit=1] positioned ~ ~ ~-1 if entity @e[type=marker,tag=gm4_blast_entry,distance=..0.5] run scoreboard players set $face_axis gm4_blast_data 3

# diagonal hit: fall back to the look direction
# up or down is the Y axis
execute if score $face_axis gm4_blast_data matches 0 store result score $look gm4_blast_data run data get entity @s Rotation[1] 1
execute if score $face_axis gm4_blast_data matches 0 if score $look gm4_blast_data matches ..-45 run scoreboard players set $face_axis gm4_blast_data 2
execute if score $face_axis gm4_blast_data matches 0 if score $look gm4_blast_data matches 45.. run scoreboard players set $face_axis gm4_blast_data 2
# level: yaw chooses X or Z
execute if score $face_axis gm4_blast_data matches 0 store result score $look gm4_blast_data run data get entity @s Rotation[0] 1
execute if score $face_axis gm4_blast_data matches 0 if score $look gm4_blast_data matches -44..44 run scoreboard players set $face_axis gm4_blast_data 3
execute if score $face_axis gm4_blast_data matches 0 if score $look gm4_blast_data matches 135..180 run scoreboard players set $face_axis gm4_blast_data 3
execute if score $face_axis gm4_blast_data matches 0 if score $look gm4_blast_data matches -180..-135 run scoreboard players set $face_axis gm4_blast_data 3
execute if score $face_axis gm4_blast_data matches 0 run scoreboard players set $face_axis gm4_blast_data 1
