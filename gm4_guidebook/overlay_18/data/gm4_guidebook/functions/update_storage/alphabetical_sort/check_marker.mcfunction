# move the marker if this is next
# @s = gm4_guide marker
# located at world spawn, with altitude of 0.0X
# run from gm4_guidebook:update_storage/alphabetical_sort/move_next_marker

# check if this is next
scoreboard players set $diff_tag gm4_guide -1
tag @s remove gm4_guide
data modify storage gm4_guidebook:temp sort.check set from entity @s Tags[0]
execute store success score $diff_tag gm4_guide run data modify storage gm4_guidebook:temp sort.check set from storage gm4_guidebook:temp sort.tags[0]
tag @s add gm4_guide

# move if so
execute if score $diff_tag gm4_guide matches 0 run tp @s ~ ~ ~
execute if score $diff_tag gm4_guide matches 0 run tag @s add gm4_guide_set
