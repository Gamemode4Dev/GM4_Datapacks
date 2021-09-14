# copies data from chest minecart and stores it
# @s = old chest minecart
# at @s
# run from gm4_chest_boats:merge


data modify storage gm4_chest_boats:temp Minecart set from entity @s
data modify entity @s Items set value []
kill @s
