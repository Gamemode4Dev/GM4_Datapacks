# @s = gm4_custom_crafter (with boots of ostara recipe)
# Run from check_recipes

# Merge item data into the temporary storage. If the item has custom name, CustomModelData, or similar
# properties that the user might not want to lose, they will override the normal Boots of Ostara tags,
# although the functionality of the boots will remain as that relies on the gm4_boots_of_ostara tag.
data modify storage gm4_boots_of_ostara:temp Item set from storage gm4_custom_crafters:temp/crafter Items[2]

execute if data storage gm4_boots_of_ostara:temp Item.tag.display{Name:'{"italic":false,"translate":"item.gm4.flippers","fallback":"Flippers"}'} run function gm4_boots_of_ostara:flippers_merge

# In case the item has a shamir or other existing lore, the Boots of Ostara lore is placed before
# existing lines of lore instead of completely replacing the lore tag.
data modify storage gm4_boots_of_ostara:temp Item.tag.display.Lore prepend value '{"translate":"item.gm4.boots_of_ostara.lore","fallback":"Brings abundance beneath you!","color":"dark_gray","italic":true}'

# place the boots in the custom crafter
loot replace block ~ ~ ~ container.0 loot gm4_boots_of_ostara:crafting/boots_of_ostara

# clean up
data remove storage gm4_boots_of_ostara:temp Item
scoreboard players reset $boa_flippers gm4_crafting
