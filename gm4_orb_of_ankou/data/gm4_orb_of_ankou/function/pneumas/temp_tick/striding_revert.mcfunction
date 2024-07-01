# @s = none
# run from pneumas/striding

scoreboard players add @e[type=marker,tag=gm4_oa_striding_block] gm4_oa_marker 1
execute at @e[type=marker,tag=gm4_oa_striding_block,scores={gm4_oa_marker=8..}] if block ~ ~ ~ magma_block run setblock ~ ~ ~ lava

execute if entity @e[type=marker,tag=gm4_oa_striding_block,limit=1] run schedule function gm4_orb_of_ankou:pneumas/temp_tick/striding_revert 1t
