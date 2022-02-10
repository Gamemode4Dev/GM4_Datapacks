# checks if this is the next module to generate pages
# @s = player who's updating their guidebook
# located at @s
# run from #gm4_guidebook:add_pages

execute if data storage gm4_guidebook:temp module{id:"tipped_skeletons"} run function gm4_tipped_skeletons:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"resurrecting_zombies"} run function gm4_resurrecting_zombies:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"resurrecting_skeletons"} run function gm4_resurrecting_skeletons:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"nightmare_nights"} run function gm4_nightmare_nights:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"mysterious_midnights"} run function gm4_mysterious_midnights:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"harvest_moons"} run function gm4_harvest_moons:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"falling_stars"} run function gm4_falling_stars:guidebook/add_pages
