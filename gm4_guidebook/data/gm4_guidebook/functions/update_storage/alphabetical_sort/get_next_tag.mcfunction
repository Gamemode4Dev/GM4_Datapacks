# saves the tags into a list of strings
# @s = none
# located at world spawn
# run from gm4_guidebook:update_storage/alphabetical_sort/parse
# run from here

# get tag
scoreboard players set $max_chars gm4_guide 512
scoreboard players set $rm_chars gm4_guide 0
data modify storage gm4_guidebook:temp sort.orig set from storage gm4_guidebook:temp sort.curr
function gm4_guidebook:update_storage/alphabetical_sort/find_quote

# save tag into list
execute store result storage gm4_guidebook:temp sort.last int 1 run scoreboard players remove $rm_chars gm4_guide 1
function gm4_guidebook:update_storage/alphabetical_sort/store_tag with storage gm4_guidebook:temp sort
data modify storage gm4_guidebook:temp sort.tags append from storage gm4_guidebook:temp sort.str

# check if this is the last tag
scoreboard players set $diff_char gm4_guide -1
data modify storage gm4_guidebook:temp sort.check set string storage gm4_guidebook:temp sort.curr 1 2
execute store success score $diff_char gm4_guide run data modify storage gm4_guidebook:temp sort.check set from storage gm4_guidebook:temp sort.end

# if not the last tag, repeat
execute if score $diff_char gm4_guide matches 1 run data modify storage gm4_guidebook:temp sort.curr set string storage gm4_guidebook:temp sort.curr 56
scoreboard players add $tag_count gm4_guide 1
execute if score $tag_count gm4_guide matches ..1024 if score $diff_char gm4_guide matches 1 run function gm4_guidebook:update_storage/alphabetical_sort/get_next_tag
