# transform enchantment id and lvl into displayable text
# @s = text display
# at chiseled bookshelf, selected book slot
# run from process_display/spawn/process_enchantments
# with $id = id of the enchantment with "minecract." stripped off
# with $lvl = level of the enchantment as integer

# if enchantment level is 10 or lower display latin number, otherwise just print level
$execute if score $enchant_lvl gm4_bookshelf_inspector_data matches 1..10 run data modify storage gm4_bookshelf_inspector:store enchantment_list append value '[{"translate":"enchantment.minecraft.$(id)"},{"text":" "},{"translate":"enchantment.level.$(lvl)"}]'
$execute unless score $enchant_lvl gm4_bookshelf_inspector_data matches 1..10 run data modify storage gm4_bookshelf_inspector:store enchantment_list append value '[{"translate":"enchantment.minecraft.$(id)"},{"text":" $(lvl)"}]'
