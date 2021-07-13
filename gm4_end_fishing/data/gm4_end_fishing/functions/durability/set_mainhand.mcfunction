# @s = player who reeled in the armor stand w/ fishing rod in mainhand
# run from durability/check

execute store result score $unbreaking_lvl gm4_ef_data run data get entity @s SelectedItem.tag.Enchantments[{id:"minecraft:unbreaking"}].lvl
function gm4_end_fishing:durability/calc_damage
item modify entity @s[gamemode=!creative] weapon.mainhand gm4_end_fishing:prepare_rod
item modify entity @s[gamemode=!creative] weapon.mainhand gm4_end_fishing:apply_damage
execute if entity @s[tag=gm4_ef_looted,gamemode=!creative] run item modify entity @s weapon.mainhand gm4_end_fishing:apply_damage
scoreboard players reset @s gm4_ef_data
scoreboard players reset $durability gm4_ef_data
scoreboard players reset $unbreaking_lvl gm4_ef_data
scoreboard players reset $unbreaking gm4_ef_data
tag @s remove gm4_ef_looted
tag @s remove gm4_ef_durability_main
