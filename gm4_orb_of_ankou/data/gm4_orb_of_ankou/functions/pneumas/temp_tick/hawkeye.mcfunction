# @s = none
# run from update_tags/check_pneuma

execute as @a[gamemode=!spectator,tag=gm4_pneuma_hawkeye,scores={gm4_oa_bow=1..}] at @s anchored eyes positioned ^ ^ ^2 run data merge entity @e[type=arrow,distance=..2.5,limit=1] {damage:4.0d,PierceLevel:1b}

execute if entity @a[tag=gm4_pneuma_hawkeye,limit=1] run schedule function gm4_orb_of_ankou:pneumas/temp_tick/hawkeye 1t
