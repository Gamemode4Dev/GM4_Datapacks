# moves additional lines from Source
# run from gm4_lore:insert

data modify storage gm4_lore:temp TempSource append from storage gm4_lore:temp Source[0]
data remove storage gm4_lore:temp Source[0]
scoreboard players add $index gm4_lore 1
