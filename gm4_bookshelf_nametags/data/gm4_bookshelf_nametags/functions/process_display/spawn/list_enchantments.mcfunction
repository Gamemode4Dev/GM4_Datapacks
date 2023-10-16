# create a list of all the enchantments
# @s = text display
# at chiseled bookshelf, selected book slot
# run from process_display/spawn/decide_name

# create array of all enchantments with levels
data modify storage gm4_bookshelf_nametags:temp enchantments set from storage gm4_bookshelf_nametags:temp book_data.tag.StoredEnchantments
data modify storage gm4_bookshelf_nametags:store enchantment_list set value []
function gm4_bookshelf_nametags:process_display/spawn/process_enchantments

# add to the text
data modify storage gm4_bookshelf_nametags:temp text append value '{"nbt":"enchantment_list[]","storage":"gm4_bookshelf_nametags:store","separator":"\\n","interpret":true,"color":"gray"}'

# cleanup
data remove storage gm4_bookshelf_nametags:temp enchantments
