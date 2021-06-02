# @s = none
# run from update_tags/check_pneuma

execute as @a[gamemode=!spectator,tag=gm4_pneuma_hawkeye,scores={gm4_oa_bow=1..}] at @s anchored eyes positioned ^ ^ ^2 run tag @e[type=arrow,distance=..2.5,limit=1] add gm4_oa_arrow
execute as @e[type=arrow,tag=gm4_oa_arrow,limit=1] store result entity @s damage byte 2 run data get entity @s damage
data merge entity @e[type=arrow,tag=gm4_oa_arrow,limit=1] {PierceLevel:1b}
tag @e[type=arrow] remove gm4_oa_arrow

execute if entity @a[tag=gm4_pneuma_hawkeye,limit=1] run schedule function gm4_orb_of_ankou:pneumas/temp_tick/hawkeye 1t
