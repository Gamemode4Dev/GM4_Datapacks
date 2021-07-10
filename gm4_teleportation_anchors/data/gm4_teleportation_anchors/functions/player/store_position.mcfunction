# @s = player who just used chorus, after they've teleported with the chorus
# run from temp_tick

execute store result score @s gm4_ta_pos_x run data get entity @s Pos[0] 100
execute store result score @s gm4_ta_pos_y run data get entity @s Pos[1] 100
execute store result score @s gm4_ta_pos_z run data get entity @s Pos[2] 100
tag @s remove gm4_ta_store_pos
tag @s add gm4_ta_track_movement

execute if entity @s[type=player] run summon armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,PortalCooldown:2147483647,Tags:["gm4_ta_blocker"]}
