# moves additional lines from Source to TempSource
# run from gm4_lore:<function>

data modify storage gm4_lore:temp TempSource append from storage gm4_lore:temp Source[0]
data remove storage gm4_lore:temp Source[0]

# loop until all of the lines are moved over
scoreboard players add $index gm4_lore 1
execute if score $index gm4_lore >= $line_count gm4_lore run scoreboard players set $index gm4_lore -1
scoreboard players remove $start gm4_lore 1
execute unless score $start gm4_lore matches 0 run function gm4_lore:utilities/start_after
