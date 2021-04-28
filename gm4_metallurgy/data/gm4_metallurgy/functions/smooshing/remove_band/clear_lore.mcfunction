# Sets item_lore_line from the first line of storage item_lore
data modify storage gm4_metallurgy:temp item_lore_line set from storage gm4_metallurgy:temp item_lore[0]

# Removes previous line (band type) from new_lore if current item_lore_line is "Shamir"
execute if data storage gm4_metallurgy:temp {item_lore_line:'{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}'} run data remove storage gm4_metallurgy:temp new_lore[-1]
# Removes next line (the shamir type) from storage item_lore if current line is "Shamir"
execute if data storage gm4_metallurgy:temp {item_lore_line:'{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}'} run data remove storage gm4_metallurgy:temp item_lore[1]
# Adds current line to new_lore if it isn't "Shamir"
execute unless data storage gm4_metallurgy:temp {item_lore_line:'{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}'} run data modify storage gm4_metallurgy:temp new_lore append from storage gm4_metallurgy:temp item_lore_line

# Remove current line from storage
data remove storage gm4_metallurgy:temp item_lore[0]

# If there's still lore in storage, run again
execute if data storage gm4_metallurgy:temp item_lore[0] run function gm4_metallurgy:smooshing/remove_band/clear_lore
