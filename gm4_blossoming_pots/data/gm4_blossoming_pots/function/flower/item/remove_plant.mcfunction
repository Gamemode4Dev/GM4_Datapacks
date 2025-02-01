# Removes a plant from a flower pot following a player empty hand right clicks on it
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {UUID}
# run from flower/prepare_data

# give player item
$execute as @p[nbt={UUID:$(UUID)}] run function gm4_blossoming_pots:flower/item/give_to_player with entity @e[tag=gm4_blossoming_pots.data.flower_pot,distance=..0.2,limit=1] data
# kill flower pot displays, perma marker, and temp marker
kill @e[type=minecraft:block_display,tag=gm4_blossoming_pots.display.flower_pot,distance=..0.2]
kill @e[type=minecraft:marker,tag=gm4_blossoming_pots.data.flower_pot,limit=1,distance=..0.2]
kill @s
