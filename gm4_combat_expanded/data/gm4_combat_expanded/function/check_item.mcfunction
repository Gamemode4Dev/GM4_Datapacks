# check items on ground for Combat Expanded items
# @s = item
# at unspecified
# run from tick

# tag item as checked and try to process
tag @s add gm4_ce_item_checked
scoreboard players set $item_processed gm4_ce_data 0

# check for spores
execute if items entity @s contents *[custom_data~{gm4_ce_spore:{}}] run function gm4_combat_expanded:mob/process/spore/initialise

# Armor Expanded - check here to not need two tick functions, but only run if expansion is actually installed
execute unless score armor_expanded gm4_modules matches 1 run return 0

# check for unidentified items
execute if score $item_processed gm4_ce_data matches 0 if items entity @s contents *[custom_data~{gm4_armor_expanded:{identified:0}}] at @s run function gm4_armor_expanded:identification/run

# tag link armor
execute if score $item_processed gm4_ce_data matches 0 if data entity @s Item.components."minecraft:custom_data".gm4_armor_expanded.link_id run tag @s add gm4_ce_link.forming
