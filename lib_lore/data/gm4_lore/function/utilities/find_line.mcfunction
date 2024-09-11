# finds the target line of lore
# run from gm4_lore:<function>

# store original lines to a temp source
data modify storage gm4_lore:temp TempSource append from storage gm4_lore:temp Source[0]
# check if the first line matches the target line
execute store success score $incorrect_line gm4_lore run data modify storage gm4_lore:temp Source[0] set from storage gm4_lore:temp Target

# remove the line from Source unless it's the target line
execute if score $incorrect_line gm4_lore matches 1 run data remove storage gm4_lore:temp Source[0]
execute if score $incorrect_line gm4_lore matches 0 run data remove storage gm4_lore:temp TempSource[-1]

# loop until the line is found
execute if score $incorrect_line gm4_lore matches 1 run scoreboard players add $index gm4_lore 1
execute if score $index gm4_lore < $line_count gm4_lore if score $incorrect_line gm4_lore matches 1 run function gm4_lore:utilities/find_line
execute if score $index gm4_lore >= $line_count gm4_lore run scoreboard players set $index gm4_lore -1
