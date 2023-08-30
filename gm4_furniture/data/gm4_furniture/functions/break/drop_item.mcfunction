# drop destroyed furniture's item
# @s = furniture item display
# at @s
# run from break/destroy with @s item.tag.data
# $(loot_table) = loot table path for this furniture item

$loot spawn ~.5 ~.25 ~.5 loot $(loot_table)
