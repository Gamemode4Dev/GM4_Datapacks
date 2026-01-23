# Stores mace data for durability calculations
# @s = player with blasting mace who just broke a block
# at @s
# run from gm4_blasting_maces:player/blast

# save mace NBT (used for unbreaking calculations)
data modify storage gm4_blasting_maces:temp tool set from entity @s SelectedItem
