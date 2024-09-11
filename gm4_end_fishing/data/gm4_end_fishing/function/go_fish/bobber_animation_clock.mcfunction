# @s = none
# run from process

execute as @e[type=armor_stand,tag=gm4_ef_has_fish] unless score @s gm4_ef_data matches 31.. at @s run function gm4_end_fishing:go_fish/bobber_animation
execute if entity @e[type=armor_stand,tag=gm4_ef_has_fish,limit=1] run schedule function gm4_end_fishing:go_fish/bobber_animation_clock 1t
