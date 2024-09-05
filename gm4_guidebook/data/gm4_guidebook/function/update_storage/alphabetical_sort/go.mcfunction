# start the sort
# @s = none
# located at world spawn
# run from gm4_guidebook:update_storage/alphabetical_sort/wait

tag @e[type=marker,tag=gm4_guide_sorter] remove gm4_guide
setblock 29999998 5 7133 command_block{auto:1b,Command:"tag @e[type=marker,tag=gm4_guide_sorter,limit=1] list"}
schedule function gm4_guidebook:update_storage/alphabetical_sort/parse 2t

# generate TOC
schedule function gm4_guidebook:update_storage/build_toc 3t
