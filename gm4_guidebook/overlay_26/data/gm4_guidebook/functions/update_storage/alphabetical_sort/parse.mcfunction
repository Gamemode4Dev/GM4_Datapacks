# parses the command block output
# @s = none
# located at world spawn
# run from gm4_guidebook:update_storage/alphabetical_sort/setup

# fallback to beet position if no entity was found
scoreboard players set $found_sorter gm4_guide 0
execute store result score $found_sorter gm4_guide run data get block 29999998 5 7133 SuccessCount
execute if score $found_sorter gm4_guide matches 0 run return 0
scoreboard players set $found_sorter gm4_guide 0
execute store result score $found_sorter gm4_guide run data get block 29999998 5 7133 LastOutput
execute if score $found_sorter gm4_guide matches 0 run return 0

# get all tags as a string
data modify storage gm4_guidebook:temp sort.curr set from block 29999998 5 7133 LastOutput

# parse string into list of tags
data modify storage gm4_guidebook:temp sort.quote set value "\""
data modify storage gm4_guidebook:temp sort.end set value "]"
## remove up to first instance of UUID
data modify storage gm4_guidebook:temp sort.curr set string storage gm4_guidebook:temp sort.curr 183
scoreboard players set $max_chars gm4_guide 60
function gm4_guidebook:update_storage/alphabetical_sort/find_quote
## remove up to next instance of UUID as hex string
data modify storage gm4_guidebook:temp sort.curr set string storage gm4_guidebook:temp sort.curr 84
scoreboard players set $max_chars gm4_guide 40
function gm4_guidebook:update_storage/alphabetical_sort/find_quote
## remove up to count of tags
data modify storage gm4_guidebook:temp sort.curr set string storage gm4_guidebook:temp sort.curr 2
scoreboard players set $max_chars gm4_guide 9
function gm4_guidebook:update_storage/alphabetical_sort/find_quote
## remove up to place before first tag
data modify storage gm4_guidebook:temp sort.curr set string storage gm4_guidebook:temp sort.curr 27
## get each tag
scoreboard players set $tag_count gm4_guide 0
data modify storage gm4_guidebook:temp sort.tags set value []
function gm4_guidebook:update_storage/alphabetical_sort/get_next_tag

# move markers
execute positioned ~ 0.01 ~ run function gm4_guidebook:update_storage/alphabetical_sort/move_next_marker

# clean up
data remove storage gm4_guidebook:temp sort
