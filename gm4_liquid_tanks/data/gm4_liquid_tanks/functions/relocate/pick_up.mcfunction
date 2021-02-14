# @s = armor stand to run pick up commands
# run from #gm4_relocators:pick_up

execute if entity @s[tag=gm4_liquid_tank] run kill @e[type=armor_stand,tag=gm4_liquid_tank_display,distance=..0.5]
execute if entity @s[tag=gm4_liquid_tank] positioned ~ ~1 ~ run kill @e[type=area_effect_cloud,distance=..0.5,tag=gm4_lt_util_block]
