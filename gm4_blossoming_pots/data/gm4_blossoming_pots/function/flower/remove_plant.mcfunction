# Removes a plant from a flower pot following a player empty hand right clicks on it
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# run from flower/prepare_data

# signal give back
scoreboard players set $signal_give_back gm4_blossoming_pots.misc 1

# store perma marker data for as_player to give the item back to the player
data modify storage gm4_blossoming_pots:flower_pots temp.perma_marker_data set from entity @e[tag=gm4_blossoming_pots.data.flower_pot,distance=..0.1,limit=1] data.gm4_blossoming_pots

# kill flower pot displays, perma marker, and temp marker
kill @e[type=minecraft:block_display,tag=gm4_blossoming_pots.display.flower_pot,distance=..0.1]
kill @e[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,limit=1,distance=..0.1]
kill @s
