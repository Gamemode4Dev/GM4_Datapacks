# copies data from storage into the boat
# @s = new boat
# at @s
# run from gm4_chest_boats:merge


data modify entity @s {} merge from storage gm4_chest_boats:temp Boat
tag @s remove gm4_cb_new_boat
