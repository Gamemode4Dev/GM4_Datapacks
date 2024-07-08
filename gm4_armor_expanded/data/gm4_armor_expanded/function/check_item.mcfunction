# check items on ground for Armor Expanded items
# @s = item
# at unspecified
# run from tick

# tag item as checked and try to process
tag @s add gm4_ae_item_checked
scoreboard players set $item_processed gm4_ae_data 0

# check for unidentified items
execute if items entity @s contents *[custom_data~{gm4_armor_expanded:{identified:0}}] at @s run function gm4_armor_expanded:identification/prep

# check for spores
execute if score $item_processed gm4_ae_data matches 0 if items entity @s contents *[custom_data~{gm4_ae_spore:{}}] run function gm4_armor_expanded:mob/process/spore/initialise

# tag link armor
execute if score $item_processed gm4_ae_data matches 0 if data entity @s Item.components."minecraft:custom_data".gm4_armor_expanded.link_id run tag @s add gm4_ae_link.forming
