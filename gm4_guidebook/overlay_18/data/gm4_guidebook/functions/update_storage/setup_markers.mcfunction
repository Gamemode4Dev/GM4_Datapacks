# prepares the guide markers
# @s = none
# located at world spawn
# run from gm4_guidebook:init

# summon markers
kill @e[type=marker,tag=gm4_guide]
kill @e[type=marker,tag=gm4_guide_sorter]
function #gm4_guidebook:summon_marker
summon marker ~ ~ ~ {Tags:["gm4_guide_sorter"],CustomName:'"gm4_guide_sorter"'}

# get all tags
execute as @e[type=marker,tag=gm4_guide] run data modify entity @e[type=marker,tag=gm4_guide_sorter,limit=1] Tags append from entity @s Tags[]
tag @e[type=marker,tag=gm4_guide_sorter] remove gm4_guide

# sort all tags
setblock 29999998 5 7133 air
schedule function gm4_guidebook:update_storage/alphabetical_sort/wait 1t
