# moves markers based on sort
# @s = gm4_guide_sorter marker
# located at world spawn, with altitude of 0.0X
# run from gm4_guidebook:update_storage/alphabetical_sort/parse
# run from here

# check all markers to see if they're next
execute as @e[type=marker,tag=gm4_guide,tag=!gm4_guide_set] run function gm4_guidebook:update_storage/alphabetical_sort/check_marker

# loop for all markers
data remove storage gm4_guidebook:temp sort.tags[0]
scoreboard players remove $tag_count gm4_guide 1
execute if score $tag_count gm4_guide matches 1.. positioned ~ ~0.01 ~ run function gm4_guidebook:update_storage/alphabetical_sort/move_next_marker
