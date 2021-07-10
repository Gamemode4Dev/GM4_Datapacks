## SOUL FORGE ##

#creation
execute if score nether_player gm4_oa_forge matches 1.. as @a[tag=gm4_oa_in_nether,scores={gm4_oa_fns=1..}] at @s run function gm4_orb_of_ankou:soul_forge/used_flint_and_steel
scoreboard players reset @a gm4_oa_fns

#check item before it burns
execute if score loaded_forge gm4_oa_forge matches 1.. at @e[type=armor_stand,tag=gm4_soul_forge] if predicate gm4_orb_of_ankou:has_multiblock align xyz as @e[type=item,tag=!gm4_oa_checked_item,dx=0,dy=0,dz=0] run function gm4_orb_of_ankou:soul_forge/recipes/check_item


## PNEUMA STUFF ##

# agile
execute if score agile_player gm4_pneuma_data matches 1.. as @a[tag=gm4_pneuma_agile] at @s if block ~ ~-0.1 ~ #gm4:no_collision if block ~ ~-1.3 ~ #gm4:no_collision if block ~ ~-2.3 ~ #gm4:no_collision if block ~ ~-3.3 ~ #gm4:no_collision run function gm4_orb_of_ankou:pneumas/agile

# striding
execute at @e[type=area_effect_cloud,tag=gm4_oa_striding_block,nbt={Age:4}] if block ~ ~ ~ magma_block run setblock ~ ~ ~ lava
execute if score striding_player gm4_pneuma_data matches 1.. as @a[tag=gm4_pneuma_striding] at @s if block ~ ~-1 ~ lava[level=0] run function gm4_orb_of_ankou:pneumas/striding

# feathery
execute as @a[tag=gm4_pneuma_feathery,scores={gm4_oa_sneak=1..}] run effect give @s slow_falling 1 0 true

# evoker fangs
execute if score conjuring_fang gm4_pneuma_data matches 1.. as @e[type=armor_stand,tag=gm4_oa_fang_thrower,scores={gm4_pneuma_data=1..}] at @s run function gm4_orb_of_ankou:pneumas/conjuring/throw

# use bow
execute if score hawkeye_player gm4_pneuma_data matches 1.. as @a[tag=gm4_pneuma_hawkeye,scores={gm4_oa_bow=1..}] at @s anchored eyes positioned ^ ^ ^2 run data merge entity @e[type=arrow,distance=..2.5,limit=1] {damage:4.0d,PierceLevel:1b}
scoreboard players reset @a gm4_oa_bow

# magic damage
execute if score magic_damaged gm4_pneuma_data matches 1.. as @a[tag=gm4_oa_magic_damaged] run function gm4_orb_of_ankou:pneumas/magic_damaged/check

# soaring damage
execute if score soaring_damaged gm4_pneuma_data matches 1.. as @a[tag=gm4_oa_soaring_damaged] run function gm4_orb_of_ankou:pneumas/soaring/back

schedule function gm4_orb_of_ankou:tick 1t
