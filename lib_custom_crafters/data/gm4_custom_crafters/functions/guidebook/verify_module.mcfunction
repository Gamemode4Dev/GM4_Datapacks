# checks if this is the next module to generate pages
# @s = player who's updating their guidebook
# located at @s
# run from #gm4_guidebook:add_pages

execute if score gm4_custom_crafters load.status matches 3 if score gm4_custom_crafters_minor load.status matches 0 if data storage gm4_guidebook:temp module{id:"custom_crafters"} run function gm4_custom_crafters:guidebook/add_pages
