
execute at @s run tp @s ^ ^ ^.1

scoreboard players remove raycast_loop gm4_si_data 1
execute at @s unless block ~ ~ ~ #minecraft:signs if score raycast_loop gm4_si_data matches 1.. run function gm4_sign_inscriber:place/raycast

