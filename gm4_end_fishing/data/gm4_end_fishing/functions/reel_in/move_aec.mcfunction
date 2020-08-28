#@s = item loot
#run from reel_in/reel_loot

scoreboard players add @s gm4_ef_data 1
tp @s ^ ^ ^0.5
execute at @s if block ^ ^ ^0.5 #gm4:no_collision unless score @s gm4_ef_data matches 100.. unless entity @a[distance=..2,tag=gm4_ef_reel_loot] run function gm4_end_fishing:reel_in/move_aec
