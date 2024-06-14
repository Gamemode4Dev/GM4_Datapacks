# add enchantments to the list 1 by 1
# @s = text display
# at chiseled bookshelf, selected book slot
# run from process_display/spawn/list_enchantments
# run from here

# get id and lvl of enchantment
data modify storage gm4_bookshelf_inspector:temp new_enchant.id set string storage gm4_bookshelf_inspector:temp enchantments[0].id 10
execute store result storage gm4_bookshelf_inspector:temp new_enchant.lvl int 1 run data get storage gm4_bookshelf_inspector:temp enchantments[0].lvl
execute store result score $enchant_lvl gm4_bookshelf_inspector_data run data get storage gm4_bookshelf_inspector:temp new_enchant.lvl

# get corresponding text using macro's
function gm4_bookshelf_inspector:process_display/spawn/eval_enchantment with storage gm4_bookshelf_inspector:temp new_enchant

# cleanup
data remove storage gm4_bookshelf_inspector:temp new_enchant

# repeat for each enchant on the book, max 3
scoreboard players remove $enchantments_max gm4_bookshelf_inspector_data 1
data remove storage gm4_bookshelf_inspector:temp enchantments[0]
execute if score $enchantments_max gm4_bookshelf_inspector_data matches 0 store result score $enchantment_count gm4_bookshelf_inspector_data run data get storage gm4_bookshelf_inspector:temp enchantments
execute if score $enchantments_max gm4_bookshelf_inspector_data matches 0 if score $enchantment_count gm4_bookshelf_inspector_data matches 1 run function gm4_bookshelf_inspector:process_display/spawn/process_enchantments
execute if score $enchantments_max gm4_bookshelf_inspector_data matches 0 if score $enchantment_count gm4_bookshelf_inspector_data matches 2.. run data modify storage gm4_bookshelf_inspector:store enchantment_list append value '{"translate":"container.shulkerBox.more","with":[{"score":{"name":"$enchantment_count","objective":"gm4_bookshelf_inspector_data"}}]}'
execute if score $enchantments_max gm4_bookshelf_inspector_data matches 1.. if data storage gm4_bookshelf_inspector:temp enchantments[0] run function gm4_bookshelf_inspector:process_display/spawn/process_enchantments
