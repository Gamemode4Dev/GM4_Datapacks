# @s = none
# run from pneumas/conjuring/prepare

execute as @e[type=armor_stand,tag=gm4_oa_fang_thrower,scores={gm4_pneuma_data=1..}] at @s run function gm4_orb_of_ankou:pneumas/conjuring/throw

execute if entity @e[type=armor_stand,tag=gm4_oa_fang_thrower,scores={gm4_pneuma_data=1..},limit=1] run schedule function gm4_orb_of_ankou:pneumas/conjuring/temp_tick 1t
