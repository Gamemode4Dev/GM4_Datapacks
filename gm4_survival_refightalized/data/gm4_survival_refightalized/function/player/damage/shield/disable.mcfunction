# damage the player from an axe to disable their shield
# @s = armor stand
# at @s
# run from 

tag @s add gm4_sr_target
execute at @s anchored eyes positioned ^ ^ ^1 summon armor_stand run return run function gm4_survival_refightalized:player/damage/shield/disabling_hit
tag @s remove gm4_sr_target
