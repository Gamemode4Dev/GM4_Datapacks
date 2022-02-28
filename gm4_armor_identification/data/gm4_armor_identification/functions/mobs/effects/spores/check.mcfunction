# run from tick
# @s = item

execute if data entity @s Item.tag.gm4_ai_spore run function gm4_armor_identification:mobs/effects/spores/initialise
tag @s add gm4_ai_item_checked
