#@s = fishing bait armor stand
#run from main

#timer and loot
scoreboard players remove @s[scores={gm4_ef_timer=0..}] gm4_ef_timer 1
execute if score @s gm4_ef_timer matches 3 run function gm4_end_fishing:go_fish/summon_fish_particle
execute if score @s gm4_ef_timer matches ..0 unless entity @s[tag=gm4_ef_has_fish] run tag @s remove gm4_fishing_bait
execute if score @s gm4_ef_timer matches ..0 unless entity @s[tag=gm4_ef_has_fish] run tag @s add gm4_ef_has_fish

#particle
execute positioned ~ ~ ~ at @e[type=minecraft:fishing_bobber,limit=1,sort=nearest,distance=..0.0001] run particle minecraft:end_rod ~ ~ ~ 0 0 0 .02 1 force

scoreboard players add @s gm4_ef_up_bait 1
execute if score @s gm4_ef_up_bait matches 2.. run function gm4_end_fishing:cast_rod/update_bait
