# Remove metallurgy tag
data remove entity @s Item.tag.gm4_metallurgy

# Copies lore from item into temp storage
data modify storage gm4_metallurgy:temp item_lore set from entity @s Item.tag.display.Lore

# Clear new_lore
data modify storage gm4_metallurgy:temp new_lore set value []

# Iterates through and edits lore if found
execute if data storage gm4_metallurgy:temp item_lore[0] run function gm4_metallurgy:smooshing/remove_band/clear_lore

# Applies new lore
data modify entity @s Item.tag.display.Lore set from storage gm4_metallurgy:temp new_lore

