# deletes additional lines from Source
# run from gm4_lore:remove

data modify storage gm4_lore:temp Dump append from storage gm4_lore:temp Source[0]
data remove storage gm4_lore:temp Source[0]

scoreboard players remove $extra gm4_lore 1
execute if score $extra gm4_lore matches 1.. run function gm4_lore:utilities/remove/extra_lines
