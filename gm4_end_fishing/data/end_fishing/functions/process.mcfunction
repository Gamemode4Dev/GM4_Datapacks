#@s = fishing bait armor stand
#run from main

#make marker
execute unless entity @s[tag=gm4_ef_marker] positioned ~ ~0.79 ~ if entity @e[type=minecraft:fishing_bobber,limit=1,sort=nearest,distance=..0.0001] run function end_fishing:cast_rod/marker

#timer and loot
scoreboard players remove @s[scores={gm4_ef_timer=0..}] gm4_ef_timer 1
execute if score @s gm4_ef_timer matches 3 run function end_fishing:go_fish/summon_fish_particle
execute if score @s gm4_ef_timer matches ..0 unless entity @s[tag=gm4_ef_has_fish] run tag @s remove gm4_fishing_bait
execute if score @s gm4_ef_timer matches ..0 unless entity @s[tag=gm4_ef_has_fish] run tag @s add gm4_ef_has_fish

#particle
execute positioned ~ ~ ~ at @e[type=minecraft:fishing_bobber,limit=1,sort=nearest,distance=..0.0001] run particle minecraft:end_rod ~ ~ ~ 0 0 0 .02 1 force

#destruction
execute positioned ~ ~0.8 ~ unless entity @e[type=minecraft:fishing_bobber,distance=..1.5] run kill @s
execute unless block ~ ~ ~ #end_fishing:traversable run kill @s
