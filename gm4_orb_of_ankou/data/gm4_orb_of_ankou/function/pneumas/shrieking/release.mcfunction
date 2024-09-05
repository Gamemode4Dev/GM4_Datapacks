# @s = player with shrieking pneuma who stopped sneaking after 60 ticks
# run from pneumas/sneak/stopped

tag @s add gm4_oa_shrieker
execute anchored eyes run function gm4_orb_of_ankou:pneumas/shrieking/find_target
tag @s remove gm4_oa_shrieker

playsound minecraft:entity.warden.sonic_boom player @a[distance=..16] ~ ~ ~ 1.3
scoreboard players reset $target_found gm4_pneuma_data
scoreboard players reset $ray gm4_pneuma_data
