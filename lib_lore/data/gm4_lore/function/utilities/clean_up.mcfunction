# all 4 functions end with this block of code, cleans up everything after the algorithms run
# run from gm4_lore:<function>

# clean up
scoreboard players reset $line_count gm4_lore
scoreboard players reset $start gm4_lore
scoreboard players reset $extra gm4_lore
scoreboard players reset $incorrect_line gm4_lore
data remove storage gm4_lore:temp TempSource
data remove storage gm4_lore:temp TempInput
