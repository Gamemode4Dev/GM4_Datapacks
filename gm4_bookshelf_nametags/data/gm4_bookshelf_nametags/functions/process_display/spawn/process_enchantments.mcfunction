# add enchantments to the list 1 by 1
# @s = text display
# at chiseled bookshelf, selected book slot
# run from process_display/spawn/list_enchantments
# run from here

# get id and lvl of enchantment
data modify storage gm4_bookshelf_nametags:temp new_enchant.id set string storage gm4_bookshelf_nametags:temp enchantments[0].id 10
execute store result storage gm4_bookshelf_nametags:temp new_enchant.lvl int 1 run data get storage gm4_bookshelf_nametags:temp enchantments[0].lvl
execute store result score $enchant_lvl gm4_bookshelf_nametags_data run data get storage gm4_bookshelf_nametags:temp new_enchant.lvl

# get corresponding text using macro's
function gm4_bookshelf_nametags:process_display/spawn/eval_enchantment with storage gm4_bookshelf_nametags:temp new_enchant

# cleanup
data remove storage gm4_bookshelf_nametags:temp new_enchant

# repeat for each enchant on the book
data remove storage gm4_bookshelf_nametags:temp enchantments[0]
execute if data storage gm4_bookshelf_nametags:temp enchantments[0] run function gm4_bookshelf_nametags:process_display/spawn/process_enchantments
