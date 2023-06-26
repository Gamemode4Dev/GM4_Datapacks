# apply saturation and hunger to wielder
# @s = player wielding the weapon
# at @s
# run from weapon/check_modifier

execute if score @s gm4_ce_hunger matches ..19 run effect give @s saturation 1 1 true
effect give @s[tag=!gm4_ce_immune_hunger] hunger 15 9
