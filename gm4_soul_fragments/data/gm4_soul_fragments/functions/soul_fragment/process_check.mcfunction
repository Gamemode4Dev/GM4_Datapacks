# @s = abandoned soul fragment
# at @s
# from main

# check if there are items or players nearby before processing
execute if entity @e[type=#gm4_soul_fragments:soul_target,distance=..22] run function gm4_soul_fragments:soul_fragment/process

# check how many nearby soul supporting blocks there are
execute store result score @s gm4_sf_block run clone ~-2 ~-1 ~-2 ~2 ~2 ~2 ~-2 ~-1 ~-2 filtered #gm4_soul_fragments:soul_friendly force

# if there are 4 or less soul supporting blocks, increase the age
execute as @s[scores={gm4_sf_block=..4}] run scoreboard players add @s gm4_sf_timer 1

# dissipate after ~30 minutes of not being around enough supporting blocks
execute if score @s gm4_sf_timer matches 2250 at @s run function gm4_soul_fragments:soul_fragment/dissipate
