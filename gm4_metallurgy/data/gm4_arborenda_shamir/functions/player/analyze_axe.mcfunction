# Calculates the speed of the axe used to break blocks.
# @s = player that just used an axe with arborenda
# at @s
# run from gm4_arborenda:player/chop

# safe axe nbt (also used to calculate unbreaking numbers in gm4_arborenda_shamir:player/modify_axe_durability)
data modify storage gm4_arborenda_shamir:temp tool set from entity @s SelectedItem

# set base material speed / breaking delay between block breaks
execute if score @s gm4_use_axe_net matches 1.. run scoreboard players set $axe_delay gm4_arb_data 5
execute if score @s gm4_use_axe_dia matches 1.. run scoreboard players set $axe_delay gm4_arb_data 6
execute if score @s gm4_use_axe_gol matches 1.. run scoreboard players set $axe_delay gm4_arb_data 3
execute if score @s gm4_use_axe_iro matches 1.. run scoreboard players set $axe_delay gm4_arb_data 8
execute if score @s gm4_use_axe_sto matches 1.. run scoreboard players set $axe_delay gm4_arb_data 13
execute if score @s gm4_use_axe_woo matches 1.. run scoreboard players set $axe_delay gm4_arb_data 22

# efficiency bonus (simplified formula, does not match vanilla)
execute store result score $efficiency_level gm4_arb_data run data get storage gm4_arborenda_shamir:temp tool.tag.Enchantments[{id:"minecraft:efficiency"}].lvl
scoreboard players operation $axe_delay gm4_arb_data -= $efficiency_level gm4_arb_data

# limit to min delay of 1 tick between block breaks
scoreboard players operation $axe_delay gm4_arb_data > #1 gm4_arb_data

# calculate max depth
scoreboard players set $max_depth gm4_arb_data 32
scoreboard players operation $max_depth gm4_arb_data *= $axe_delay gm4_arb_data
