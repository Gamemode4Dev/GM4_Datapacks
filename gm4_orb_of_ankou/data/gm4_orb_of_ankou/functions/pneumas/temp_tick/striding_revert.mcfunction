# @s = none
# run from pneumas/striding

execute at @e[type=area_effect_cloud,tag=gm4_oa_striding_block,nbt={Age:8}] if block ~ ~ ~ magma_block run setblock ~ ~ ~ lava

execute if entity @e[type=area_effect_cloud,tag=gm4_oa_striding_block,limit=1] run schedule function gm4_orb_of_ankou:pneumas/temp_tick/striding_revert 1t
