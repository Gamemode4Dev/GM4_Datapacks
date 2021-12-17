# interprets each page of the table of contents
# @s = none
# located at world spawn
# run from gm4_guidebook:analyze_storage/interpret/build_pages

# add initial lines from the "Table of Contents" header
scoreboard players set $line_count gm4_guide 2

# populate the page with the installed modules
scoreboard players add $toc_pages gm4_guide 1
schedule function gm4_guidebook:analyze_storage/loop_line 1t
