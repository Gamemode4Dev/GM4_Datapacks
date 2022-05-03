# check items on ground for spores
# @s = item
# run from tick

execute if data entity @s Item.tag.gm4_ce_spore run function gm4_combat_expanded:mobs/effects/spores/initialise
tag @s add gm4_ce_item_checked
