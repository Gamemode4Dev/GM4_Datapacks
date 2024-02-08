# burn entity near burn armor
# @s = entity near active burn armor
# at player wearing active burn armor
# run from armor/modifier/type/burn/active

$damage @s $(damage) on_fire by @p[tag=gm4_ce_self]
execute unless entity @s[type=player] run data modify entity @s Fire set value 25
item replace entity @s[tag=gm4_ce_spore_zombie] armor.head with air
