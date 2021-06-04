# all 4 functions start with this block of code, sets up everything before the rest of the algorithms run
# run from gm4_lore:<function>

scoreboard players set $index gm4_lore 0
execute store result score $line_count gm4_lore run data get storage gm4_lore:temp Source
data remove storage gm4_lore:temp TempSource
data remove storage gm4_lore:temp Dump
