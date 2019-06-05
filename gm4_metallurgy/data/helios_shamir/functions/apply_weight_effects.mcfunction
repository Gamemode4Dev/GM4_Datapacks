#@s = all players
#run from weighted_armour:main via #weighted_armor:apply_weight_effects

execute if score @s gm4_armor_weight matches ..-1 run effect give @s levitation 1 0
execute if score @s gm4_armor_weight matches ..-1 run effect give @s wither 1 1
