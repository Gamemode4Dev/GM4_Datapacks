# manages spore movements and a slow clock
# @s = none
# at world spawn
# run from gm4_shroomites:main

# reset clock counter
scoreboard players set $fast_clock gm4_shroom_data 0

# handle spores
scoreboard players set $global_spore_count gm4_shroom_data 0
execute as @e[type=marker,tag=gm4_shroomite_spore] at @s run function gm4_shroomites:spore/track_age

# manage slow clock
scoreboard players add $slow_clock gm4_shroom_data 1

# trigger shroom placement and spore spawning
execute if score $slow_clock gm4_shroom_data matches 4.. run function gm4_shroomites:slow_clock
