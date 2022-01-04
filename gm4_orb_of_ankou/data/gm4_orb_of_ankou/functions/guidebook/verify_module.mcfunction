# checks if this is the next module to generate pages
# @s = player who's updating their guidebook
# located at @s
# run from #gm4_guidebook:add_pages

execute if data storage gm4_guidebook:temp module{id:"orb_of_ankou"} run function gm4_orb_of_ankou:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"corripio_shamir"} run function gm4_corripio_shamir:guidebook/add_pages
