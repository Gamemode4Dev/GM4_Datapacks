# sets up the sorter marker
# @s = new marker (from execute summon)
# located at world spawn
# run from gm4_guidebook:update_storage/setup_markers

# get all tags
tag @s add gm4_guide_sorter
execute as @e[type=marker,tag=gm4_guide] run data modify entity @e[type=marker,tag=gm4_guide_sorter,limit=1] Tags append from entity @s Tags[]
tag @s remove gm4_guide

# sort all tags
setblock 29999998 5 7133 air
setblock 29999998 5 7133 command_block{auto:1b,Command:"tag @e[type=marker,tag=gm4_guide_sorter,limit=1] list"}
schedule function gm4_guidebook:update_storage/alphabetical_sort/parse 2t
