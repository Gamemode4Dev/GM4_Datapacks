# @s = none
# run from go_fish/summon_fish_particle

execute as @e[type=marker,tag=gm4_ef_particle] at @s run function gm4_end_fishing:go_fish/move_fish_particle
execute if entity @e[type=marker,tag=gm4_ef_particle,limit=1] run schedule function gm4_end_fishing:go_fish/fish_particle_clock 1t
