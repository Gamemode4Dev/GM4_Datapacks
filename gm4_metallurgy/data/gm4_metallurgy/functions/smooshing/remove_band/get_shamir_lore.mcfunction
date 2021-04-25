# Sets item_lore_line from the first line of storage item_lore
data modify storage gm4_metallurgy:temp item_lore_line set from storage gm4_metallurgy:temp item_lore[0]

# Add lore to storage shamir_lore if current lore line is "Shamir"
execute if data storage gm4_metallurgy:temp {item_lore_line:'{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}'} run data modify storage gm4_metallurgy:temp shamir_lore set from storage gm4_metallurgy:temp item_lore[1]

# Remove first line of lore in storage
data remove storage gm4_metallurgy:temp item_lore[0]

# If there's still lore in storage, run again
execute if data storage gm4_metallurgy:temp item_lore[0] run function gm4_metallurgy:smooshing/remove_band/get_shamir_lore
