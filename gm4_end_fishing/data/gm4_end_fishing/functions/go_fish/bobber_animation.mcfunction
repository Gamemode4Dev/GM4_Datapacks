#@s = fishing bait armor stand with fish
#run from tick

scoreboard players add @s gm4_ef_data 1
execute if score @s gm4_ef_data matches 1 at @s run playsound minecraft:entity.ender_dragon.flap neutral @a[distance=..50] ~ ~ ~ 4 0.7
execute if score @s gm4_ef_data matches 1..5 at @s run tp @s ~ ~-0.1 ~
execute if score @s gm4_ef_data matches 5 at @e[type=minecraft:fishing_bobber,limit=1,distance=..0.0001] run summon item ~ ~ ~ {NoGravity:1,PickupDelay:32767,Age:6000,Item:{id:"minecraft:stone_button",Count:1}}
execute if score @s gm4_ef_data matches 11..15 at @s run tp @s ~ ~0.1 ~
execute if score @s gm4_ef_data matches 15 at @e[type=minecraft:fishing_bobber,limit=1,distance=..0.0001] run summon item ~ ~ ~ {NoGravity:1,PickupDelay:32767,Age:6000,Item:{id:"minecraft:stone_button",Count:1}}
execute if score @s gm4_ef_data matches 30.. run function gm4_end_fishing:cast_rod/randomize_timer
execute if score @s gm4_ef_data matches 30.. run tag @s add gm4_fishing_bait
execute if score @s gm4_ef_data matches 30.. run tag @s remove gm4_ef_has_fish
execute if score @s gm4_ef_data matches 30.. run scoreboard players reset @s gm4_ef_data
