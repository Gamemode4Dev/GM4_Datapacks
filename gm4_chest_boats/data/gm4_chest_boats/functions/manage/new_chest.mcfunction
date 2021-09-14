# copies data from storage into the chest minecart
# @s = new chest minecart
# at @s
# run from gm4_chest_boats:merge


data modify entity @s {} merge from storage gm4_chest_boats:temp Minecart
tag @s remove gm4_cb_new_chest
