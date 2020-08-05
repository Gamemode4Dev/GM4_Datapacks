# @s = gm4_liquid_tank to be picked up by relocator
# run from relocate/pick_up_check

scoreboard players set valid_machine gm4_rl_data 1

setblock ~ ~ ~ air
playsound minecraft:block.beacon.power_select block @a[distance=..8] ~ ~ ~ 1 1.8
particle minecraft:explosion ~ ~ ~ 0 0 0 0 0

loot spawn ~ ~0.7 ~ loot gm4_liquid_tanks:relocator

kill @e[type=armor_stand,tag=gm4_liquid_tank_display,distance=..0.5]
execute positioned ~ ~1 ~ run kill @e[type=area_effect_cloud,distance=..0.5,tag=gm4_lt_util_block]
kill @s
