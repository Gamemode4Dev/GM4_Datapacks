# @s = player that just used an axe with arborenda
# run from chop

execute if score @s gm4_use_axe_net matches 1.. run scoreboard players set max_damage gm4_ml_data 2030
execute if score @s gm4_use_axe_dia matches 1.. run scoreboard players set max_damage gm4_ml_data 1560
execute if score @s gm4_use_axe_gol matches 1.. run scoreboard players set max_damage gm4_ml_data 32
execute if score @s gm4_use_axe_iro matches 1.. run scoreboard players set max_damage gm4_ml_data 249
execute if score @s gm4_use_axe_sto matches 1.. run scoreboard players set max_damage gm4_ml_data 130
execute if score @s gm4_use_axe_woo matches 1.. run scoreboard players set max_damage gm4_ml_data 58

execute store result score damage gm4_ml_data run data get entity @s SelectedItem.tag.Damage
scoreboard players operation damage gm4_ml_data += chop_count gm4_ml_data
scoreboard players operation damage gm4_ml_data < max_damage gm4_ml_data

execute store result storage gm4_metallurgy:temp Damage int 1 run scoreboard players get damage gm4_ml_data
item modify entity @s weapon.mainhand gm4_arborenda_shamir:set_damage
