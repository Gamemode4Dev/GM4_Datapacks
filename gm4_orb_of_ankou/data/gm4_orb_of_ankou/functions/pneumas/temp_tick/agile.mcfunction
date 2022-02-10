# @s = none
# run from update_tags/check_pneuma

execute as @a[gamemode=!spectator,tag=gm4_pneuma_agile] at @s if block ~ ~-0.1 ~ #gm4:no_collision if block ~ ~-1.3 ~ #gm4:no_collision if block ~ ~-2.3 ~ #gm4:no_collision if block ~ ~-3.3 ~ #gm4:no_collision run function gm4_orb_of_ankou:pneumas/agile

execute if entity @a[tag=gm4_pneuma_agile,limit=1] run schedule function gm4_orb_of_ankou:pneumas/temp_tick/agile 1t
