# checks each slot for item tags
# @s = crafter armor stand
# located at @s
# run from gm4_forming_press:check_item_tags_verify

execute if predicate gm4_forming_press:vanilla_item_tags/logs_that_burn run data modify storage gm4_forming_press:temp/crafter item.item_tags.minecraft.logs_that_burn set value 1b
