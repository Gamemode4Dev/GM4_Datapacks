# check for section changes
# @s = none
# located at world spawn
# run from gm4_guidebook:lecterns/section/track

execute as @e[type=marker,tag=gm4_guide_tracking] at @s if block ~ ~ ~ lectern[has_book=true] run function gm4_guidebook:lecterns/section/check_page

execute if entity @e[type=marker,tag=gm4_guide_tracking,limit=1] run schedule function gm4_guidebook:lecterns/section/tracking 1t
