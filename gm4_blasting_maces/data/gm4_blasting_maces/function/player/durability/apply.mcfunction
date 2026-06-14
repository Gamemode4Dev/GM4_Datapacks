# Applies durability loss for the blocks broken
# @s = player holding the blasting mace
# at @s
# run from gm4_blasting_maces:player/blast

# tools in creative mode never lose durability
execute if entity @s[gamemode=creative] run return 0

# copy the held mace and its slot into storage
# main hand uses SelectedItem because players do not use equipment.mainhand
execute if score @s gm4_blast_slot matches 0.. run data modify storage gm4_blasting_maces:temp slot set value "weapon.mainhand"
execute if score @s gm4_blast_slot matches 0.. run data modify storage gm4_blasting_maces:temp tool set from entity @s SelectedItem
execute if score @s gm4_blast_slot matches -1 run data modify storage gm4_blasting_maces:temp slot set value "weapon.offhand"
execute if score @s gm4_blast_slot matches -1 run data modify storage gm4_blasting_maces:temp tool set from entity @s equipment.offhand

function gm4_blasting_maces:player/durability/calculate
data remove storage gm4_blasting_maces:temp tool
data remove storage gm4_blasting_maces:temp slot
