# places the book in the zombie villager's hand
# @s = random zombie villager that spawned naturally (not converted)
# located at world spawn
# run from gm4_guidebook:main

# put book in mainhand, and populate the table of contents
loot replace entity @s weapon.mainhand loot gm4_guidebook:items/guidebook
#function gm4_guidebook:analyze_storage/populate_mainhand

# make zombie drop the book upon player kill
data modify entity @s HandDropChances[0] set value 1.0f
