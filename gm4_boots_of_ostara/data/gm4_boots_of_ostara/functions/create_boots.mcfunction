# @s = gm4_custom_crafter (with boots of ostara recipe)
# Run from recipe_check

# Set most of the Boots of Ostara's defining tags. These can mostly be overriden by the merge operation
# below, but gm4_custom_crafters is internal to how CCs work and gm4_boots_of_ostara is already guaranteed
# to be unset as a condition for the recipe to be processed.
data modify storage gm4_boots_of_ostara:temp Item set value {tag:{CustomModelData:1,gm4_custom_crafters:{multiplier:1},gm4_boots_of_ostara:1b,HideFlags:64,display:{Name:'{"translate":"%1$s%3427655$s","with":["Boots of Ostara",{"translate":"item.gm4.boots_of_ostara"}],"italic":false}',color:3705899}}}

# Merge item data into the temporary storage. If the item has custom name, CustomModelData, or similar
# properties that the user might not want to lose, they will override the normal Boots of Ostara tags,
# although the functionality of the boots will remain as that relies on the gm4_boots_of_ostara tag.
data modify storage gm4_boots_of_ostara:temp Item merge from storage gm4_custom_crafters:temp/crafter Items[2]

# In case the item has a shamir or other existing lore, the Boots of Ostara lore is placed before
# existing lines of lore instead of completely replacing the lore tag.
data modify storage gm4_boots_of_ostara:temp Item.tag.display.Lore prepend value '{"translate":"%1$s%3427655$s","with":["Brings abundance beneath you!",{"translate":"item.gm4.boots_of_ostara.lore"}],"color":"dark_gray","italic":true}'

# Clear the custom crafter of recipe ingredients and place the newly crafted Boots of Ostara inside.
data remove storage gm4_custom_crafters:temp/crafter Items
data modify storage gm4_custom_crafters:temp/crafter Items append from storage gm4_boots_of_ostara:temp Item
