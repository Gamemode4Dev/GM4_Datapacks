# run from tick
# @s = item

execute if data entity @s Item.tag.gm4_ce_spore run function gm4_combat_evolved:mobs/effects/spores/initialise
tag @s add gm4_ce_item_checked
