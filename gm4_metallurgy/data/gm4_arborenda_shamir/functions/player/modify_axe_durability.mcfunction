# Reduces the durability on an arborenda axe according to the amount of blocks broken.
# @s = player that just used an axe with arborenda
# at @s
# run from gm4_arborenda:player/chop

# get max damage for material type
execute if score @s gm4_use_axe_net matches 1.. run scoreboard players set $max_damage gm4_arb_data 2030
execute if score @s gm4_use_axe_dia matches 1.. run scoreboard players set $max_damage gm4_arb_data 1560
execute if score @s gm4_use_axe_gol matches 1.. run scoreboard players set $max_damage gm4_arb_data 32
execute if score @s gm4_use_axe_iro matches 1.. run scoreboard players set $max_damage gm4_arb_data 249
execute if score @s gm4_use_axe_sto matches 1.. run scoreboard players set $max_damage gm4_arb_data 130
execute if score @s gm4_use_axe_woo matches 1.. run scoreboard players set $max_damage gm4_arb_data 58

# get unbreaking level
execute store result score $unbreaking_level gm4_arb_data run data get storage gm4_arborenda_shamir:temp tool.tag.Enchantments[{id:"minecraft:unbreaking"}].lvl
scoreboard players add $unbreaking_level gm4_arb_data 1
scoreboard players set $damage_chance gm4_arb_data 100
scoreboard players operation $damage_chance gm4_arb_data /= $unbreaking_level gm4_arb_data

# calclulate and apply damage
execute store result score $current_damage gm4_arb_data run data get storage gm4_arborenda_shamir:temp tool.tag.Damage
execute store result score $incoming_damage gm4_arb_data run loot spawn ~ -4096 ~ loot gm4_arborenda_shamir:roll_binomial_distribution
scoreboard players operation $current_damage gm4_arb_data += $incoming_damage gm4_arb_data
scoreboard players operation $current_damage gm4_arb_data < $max_damage gm4_arb_data

execute store result storage gm4_arborenda_shamir:temp damage int 1 run scoreboard players get $current_damage gm4_arb_data
item modify entity @s weapon.mainhand gm4_arborenda_shamir:set_damage
