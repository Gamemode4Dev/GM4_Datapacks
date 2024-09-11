schedule function gm4_end_fishing:tick 1t

# catch fishing bobber in the end
execute in minecraft:the_end as @e[type=minecraft:fishing_bobber,tag=!smithed.entity,tag=!gm4_ef_casted,x_rotation=-90..-85,x=0] at @s positioned ~ ~-5 ~ run function gm4_end_fishing:cast_rod/summon_bait

# store bobber data
execute in minecraft:the_end as @e[type=minecraft:fishing_bobber,tag=!smithed.entity,tag=!gm4_ef_set,x=0] at @s run function gm4_end_fishing:cast_rod/store_data

# reset cast rod score
scoreboard players reset @a gm4_cast_rod

# enderpuff slow falling
tag @a[tag=!gm4_has_enderpuff] remove gm4_ef_fall
tag @a[predicate=!gm4_end_fishing:slow_falling] remove gm4_ef_fall
execute as @a[tag=gm4_has_enderpuff,tag=!gm4_ef_fall,predicate=gm4_end_fishing:slow_falling] run function gm4_end_fishing:enderpuff/apply_slow_falling
scoreboard players reset @a gm4_ef_sneak
