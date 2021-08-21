# checks if this is the next module to generate pages
# @s = player who's updating their guidebook
# located at @s
# run from #gm4_guidebook:add_pages

execute if data storage gm4_guidebook:temp module{id:"slime_fests"} run function gm4_slime_fests:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"sandy_husks"} run function gm4_sandy_husks:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"menacing_goblins"} run function gm4_menacing_goblins:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"illusioner_nights"} run function gm4_illusioner_nights:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"icy_strays"} run function gm4_icy_strays:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"enlarging_phantoms"} run function gm4_enlarging_phantoms:guidebook/add_pages
