# moves lines from TempSource back to Source
# run from gm4_lore:insert and gm4_lore:remove

data modify storage gm4_lore:temp Source prepend from storage gm4_lore:temp TempSource[-1]
data remove storage gm4_lore:temp TempSource[-1]

# loop until all of the lines are moved over
execute unless score $index gm4_lore matches 0 run scoreboard players remove $index gm4_lore 1
scoreboard players add $start gm4_lore 1
execute unless score $start gm4_lore matches 0 run function gm4_lore:utilities/start_before
