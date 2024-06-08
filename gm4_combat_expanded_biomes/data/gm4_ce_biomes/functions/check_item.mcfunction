# check items on ground for Combat Expanded items
# @s = item
# at unspecified
# run from tick

# tag item as checked and try to process
tag @s add gm4_ce_biomes_item_checked

# check for spores
execute if items entity @s contents *[custom_data~{gm4_ce_spore:{}}] run function gm4_ce_base:mob/process/spore/initialise
