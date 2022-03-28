# run from weapon/check_modifier
# @s = player wielding the weapon
# at @s

execute if score @s gm4_ce_hunger matches ..19 run effect give @s saturation 1 1 true
effect give @s hunger 15 9
