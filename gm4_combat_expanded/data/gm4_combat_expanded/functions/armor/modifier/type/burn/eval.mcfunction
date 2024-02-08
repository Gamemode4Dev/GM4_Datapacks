# burn entity near burn armor
# @s = entity near active burn armor
# at player wearing active burn armor
# run from armor/modifier/type/burn/active

$damage @s $(damage) on_fire
item replace entity @s[tag=gm4_ce_spore_zombie] armor.head with air

execute unless score $full_burn gm4_ce_data matches 1 run particle minecraft:small_flame ~ ~1 ~ 0.25 0.3 0.25 0 4
execute if score $full_burn gm4_ce_data matches 1 run particle minecraft:flame ~ ~1 ~ 0.25 0.3 0.25 0.05 8

execute if score $full_burn gm4_ce_data matches 1 unless entity @s[type=player] run data modify entity @s Fire set value 15
