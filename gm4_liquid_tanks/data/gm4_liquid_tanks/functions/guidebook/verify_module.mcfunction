# checks if this is the next module to generate pages
# @s = player who's updating their guidebook
# located at @s
# run from #gm4_guidebook:add_pages

execute if data storage gm4_guidebook:temp module{id:"standard_liquids"} run function gm4_standard_liquids:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"liquid_tanks"} run function gm4_liquid_tanks:guidebook/add_pages
