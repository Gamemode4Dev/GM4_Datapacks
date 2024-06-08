# finds the next quotation mark, while saving everything before it
# @s = none
# located at world spawn
# run from gm4_guidebook:update_storage/alphabetical_sort/parse
# run from gm4_guidebook:update_storage/alphabetical_sort/get_next_tag
# run from here

# check if first char is a quotation mark
scoreboard players set $diff_char gm4_guide -1
data modify storage gm4_guidebook:temp sort.check set string storage gm4_guidebook:temp sort.curr 0 1
execute store success score $diff_char gm4_guide run data modify storage gm4_guidebook:temp sort.check set from storage gm4_guidebook:temp sort.quote

# discard char and repeat
data modify storage gm4_guidebook:temp sort.curr set string storage gm4_guidebook:temp sort.curr 1
scoreboard players remove $max_chars gm4_guide 1
scoreboard players add $rm_chars gm4_guide 1
execute if score $max_chars gm4_guide matches 1.. if score $diff_char gm4_guide matches 1 run function gm4_guidebook:update_storage/alphabetical_sort/find_quote
