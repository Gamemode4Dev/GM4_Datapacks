# copies data from boat and stores it
# @s = old boat
# at @s
# run from gm4_chest_boats:merge


data modify storage gm4_chest_boats:temp Boat set from entity @s
kill @s
