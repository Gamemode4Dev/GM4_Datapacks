# @s = none
# run from pneumas/dashing/prepare

scoreboard players add @e[type=armor_stand,tag=gm4_oa_dasher] gm4_oa_marker 1
kill @e[type=armor_stand,tag=gm4_oa_dasher,scores={gm4_oa_marker=15..}]

execute as @e[type=armor_stand,tag=gm4_oa_dasher] at @s run function gm4_orb_of_ankou:pneumas/dashing/update_dasher

execute if entity @e[type=armor_stand,tag=gm4_oa_dasher,limit=1] run schedule function gm4_orb_of_ankou:pneumas/dashing/temp_tick 1t
