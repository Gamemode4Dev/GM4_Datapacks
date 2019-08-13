#@s refers to a player who has just shot a crossbow
#run from shoot_arrow in order to reduce the amount of identical checks performed (EnCaPSulAtIoN)

#reset scoreboard to 0
scoreboard players set string_placed gm4_string_count 0

#south
execute positioned ~ ~1.62 ~1 if block ~ ~ ~ #roped_arrows:airtype if score @s gm4_rot_y matches -20..20 run function roped_arrows:unspool_string_south
execute positioned ~ ~1.62 ~1 if block ~ ~ ~ #roped_arrows:airtype if score @s gm4_rot_y matches -360..-340 run function roped_arrows:unspool_string_south
execute positioned ~ ~1.62 ~1 if block ~ ~ ~ #roped_arrows:airtype if score @s gm4_rot_y matches 340..360 run function roped_arrows:unspool_string_south

#west
execute positioned ~-1 ~1.62 ~ if block ~ ~ ~ #roped_arrows:airtype if score @s gm4_rot_y matches 70..110 run function roped_arrows:unspool_string_west
execute positioned ~-1 ~1.62 ~ if block ~ ~ ~ #roped_arrows:airtype if score @s gm4_rot_y matches -290..-250 run function roped_arrows:unspool_string_west

#north
execute positioned ~ ~1.62 ~-1 if block ~ ~ ~ #roped_arrows:airtype if score @s gm4_rot_y matches 160..200 run function roped_arrows:unspool_string_north
execute positioned ~ ~1.62 ~-1 if block ~ ~ ~ #roped_arrows:airtype if score @s gm4_rot_y matches -200..-160 run function roped_arrows:unspool_string_north

#east
execute positioned ~1 ~1.62 ~ if block ~ ~ ~ #roped_arrows:airtype if score @s gm4_rot_y matches 250..290 run function roped_arrows:unspool_string_east
execute positioned ~1 ~1.62 ~ if block ~ ~ ~ #roped_arrows:airtype if score @s gm4_rot_y matches -110..-70 run function roped_arrows:unspool_string_east