# check items on ground for Combat Expanded items
# @s = item
# at unspecified
# run from tick

# check for spores
execute if data entity @s Item.tag.gm4_ce_spore run function gm4_combat_expanded:mob/process/spore/initialise

# check for unidentified items
execute if data entity @s Item.tag.gm4_combat_expanded{identified:0} run function gm4_combat_expanded:identification/prep

# tag item as checked
tag @s add gm4_ce_item_checked
