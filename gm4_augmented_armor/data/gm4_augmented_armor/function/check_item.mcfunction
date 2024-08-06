# check items on ground for Augmented Armor items
# @s = item
# at unspecified
# run from tick

# tag item as checked and try to process
tag @s add gm4_aa_item_checked
scoreboard players set $item_processed gm4_aa_data 0

# check for unidentified items
execute if items entity @s contents *[custom_data~{gm4_augmented_armor:{identified:0}}] at @s run function gm4_augmented_armor:identification/run

# tag link armor
execute if score $item_processed gm4_aa_data matches 0 if data entity @s Item.components."minecraft:custom_data".gm4_augmented_armor.link_id run tag @s add gm4_aa_link.forming
