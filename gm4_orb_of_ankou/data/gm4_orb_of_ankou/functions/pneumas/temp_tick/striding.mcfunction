# @s = none
# run from update_tags/check_pneuma

execute as @a[gamemode=!spectator,tag=gm4_pneuma_striding] at @s if block ~ ~-1 ~ lava[level=0] run function gm4_orb_of_ankou:pneumas/striding

execute if entity @a[tag=gm4_pneuma_striding,limit=1] run schedule function gm4_orb_of_ankou:pneumas/temp_tick/striding 1t
