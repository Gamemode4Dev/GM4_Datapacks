# checks if this is the next module to generate pages
# @s = player who's updating their guidebook
# located at @s
# run from #gm4_guidebook:add_pages

execute if data storage gm4_guidebook:temp module{id:"beehive_inspector"} run function gm4_beehive_inspector:guidebook/add_pages
