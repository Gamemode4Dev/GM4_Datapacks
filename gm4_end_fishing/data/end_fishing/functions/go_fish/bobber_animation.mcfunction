#@s = fishing bait armor stand with fish
#run from pulse_check

scoreboard players add @s gm4_ef_data 1
execute if score @s gm4_ef_data matches 1 at @s run playsound minecraft:entity.ender_dragon.flap neutral @a[distance=..50] ~ ~ ~ 4 0.7
execute if score @s gm4_ef_data matches 1..5 at @s run tp @s ~ ~-0.1 ~
execute if score @s gm4_ef_data matches 6..10 at @s run tp @s ~ ~0.1 ~
execute if score @s gm4_ef_data matches 30.. run function end_fishing:cast_rod/randomize_timer
execute if score @s gm4_ef_data matches 30.. run tag @s add gm4_fishing_bait
execute if score @s gm4_ef_data matches 30.. run tag @s remove gm4_ef_has_fish
execute if score @s gm4_ef_data matches 30.. run scoreboard players reset @s gm4_ef_data
