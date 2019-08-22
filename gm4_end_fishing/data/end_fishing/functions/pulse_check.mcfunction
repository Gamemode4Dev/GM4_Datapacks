#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = end_fishing gm4_clock_tick run function end_fishing:main

#catch fishing bobber in the end
execute in minecraft:the_end as @e[type=minecraft:fishing_bobber,tag=!gm4_ef_casted,x_rotation=-90..-80,distance=0..] at @s unless entity @e[type=minecraft:armor_stand,tag=gm4_fishing_bait,distance=..3] run function end_fishing:cast_rod/summon_bait

#store bobber data
execute in minecraft:the_end as @e[type=minecraft:fishing_bobber,tag=!gm4_ef_set,distance=0..] at @s run function end_fishing:cast_rod/store_data

#reset cast rod score
scoreboard players reset @a gm4_cast_rod

#bob fishing bait
execute as @e[type=armor_stand,tag=gm4_ef_has_fish] at @s unless score @s gm4_ef_data matches 31.. run function end_fishing:go_fish/bobber_animation

#check durability
execute if score durability gm4_ef_data matches 1 as @a[tag=gm4_ef_durability] run function end_fishing:durability/check

#particle
execute as @e[type=area_effect_cloud,tag=gm4_ef_particle] at @s run particle minecraft:dragon_breath ~ ~ ~ 0 0 0 0.02 1
execute as @e[type=area_effect_cloud,tag=gm4_ef_particle] at @s run tp @s ^ ^ ^0.1
