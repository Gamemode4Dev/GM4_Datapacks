# gives the player the items from the custom flower pot back when right clicking with an empty hand
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with entity @s data
# run from flower/as_marker

# give player item
$execute as @p[nbt={UUID:$(UUID)}] run function gm4_blossoming_pots:flower/item/give with entity @n[tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2] data
# kill flower pot displays, perma marker, and temp marker
kill @e[tag=gm4_blossoming_pots.display.flower_pot,sort=nearest,distance=..0.2]
kill @e[tag=gm4_blossoming_pots.data.flower_pot,sort=nearest,distance=..0.2]
kill @s