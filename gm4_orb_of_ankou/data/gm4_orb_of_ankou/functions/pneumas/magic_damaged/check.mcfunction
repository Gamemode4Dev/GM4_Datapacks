# @s = player who took damage by magic
# run from pneumas/temp_tick/magic_damaged

execute if entity @s[tag=gm4_has_pneuma,tag=!gm4_oa_magic_ignore,tag=gm4_oa_magic_1] run function gm4_orb_of_ankou:pneumas/magic_damaged/magic_1
execute if entity @s[tag=gm4_has_pneuma,tag=!gm4_oa_magic_ignore,tag=!gm4_oa_magic_1,tag=gm4_oa_magic_2] run function gm4_orb_of_ankou:pneumas/magic_damaged/magic_2

tag @s remove gm4_oa_magic_damaged
tag @s remove gm4_oa_magic_1
tag @s remove gm4_oa_magic_2
tag @s remove gm4_oa_magic_ignore
