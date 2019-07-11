#@s = decorative area_effect_cloud
#run from recharge/check_for_flower

execute at @s run teleport ^ ^ ^0.4
execute at @s run particle dragon_breath ~ ~1 ~ 0 0 0 .005 3
execute at @s if entity @e[tag=gm4_alchemical_crafter,distance=..1] run kill @s
execute at @s if block ~ ~ ~ cauldron run kill @s
