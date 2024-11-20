# @s = fishing bait armor stand
# run from main

# timer and loot
scoreboard players remove @s[scores={gm4_ef_timer=0..}] gm4_ef_timer 1
execute if score @s gm4_ef_timer matches 2 run function gm4_end_fishing:go_fish/summon_fish_particle
tag @s[scores={gm4_ef_timer=0}] remove gm4_end_fishing_bait
tag @s[scores={gm4_ef_timer=0}] add gm4_ef_has_fish
execute if score @s gm4_ef_timer matches 0 run schedule function gm4_end_fishing:go_fish/bobber_animation_clock 1t

# particle
execute at @e[type=minecraft:fishing_bobber,limit=1,distance=..0.0001] run particle minecraft:end_rod ~ ~ ~ 0 0 0 .02 1 force

scoreboard players add @s gm4_ef_up_bait 1
execute if score @s gm4_ef_up_bait matches 2.. run function gm4_end_fishing:cast_rod/update_bait
