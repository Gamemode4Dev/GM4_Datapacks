# checks if this is the next module to generate pages
# @s = player who's updating their guidebook
# located at @s
# run from #gm4_guidebook:add_pages

execute if data storage gm4_guidebook:temp module{id:"weighted_armour"} run function gm4_weighted_armour:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"helious_shamir"} run function gm4_helious_shamir:guidebook/add_pages
