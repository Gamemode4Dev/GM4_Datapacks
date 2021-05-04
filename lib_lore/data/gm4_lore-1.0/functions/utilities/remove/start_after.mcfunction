# moves additional lines from Source to TempSource
# run from gm4_lore:remove

data modify storage gm4_lore:temp TempSource append from storage gm4_lore:temp Source[0]
data remove storage gm4_lore:temp Source[0]

# loop until all of the lines are moved over
scoreboard players remove $start gm4_lore 1
execute unless score $start gm4_lore matches 0 run function gm4_lore-1.0:utilities/remove/start_after
