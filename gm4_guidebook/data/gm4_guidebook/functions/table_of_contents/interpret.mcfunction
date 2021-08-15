# interprets the table of contents based on the installed modules
# @s = none
# located at world spawn
# run from gm4_guidebook:init

# prepare the storage
scoreboard players reset $toc_pages gm4_guide
data modify storage gm4_guidebook:temp modules set from storage gm4_guidebook:register modules
data modify storage gm4_guidebook:register table_of_contents set value []

# set the pages of the table of contents
function gm4_guidebook:table_of_contents/loop_page

# clean up
data remove storage gm4_guidebook:temp modules
