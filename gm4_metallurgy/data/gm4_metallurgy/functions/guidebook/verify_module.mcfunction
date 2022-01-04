# checks if this is the next module to generate pages
# @s = player who's updating their guidebook
# located at @s
# run from #gm4_guidebook:add_pages

execute if data storage gm4_guidebook:temp module{id:"vibro_shamir"} run function gm4_vibro_shamir:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"tinker_shamir"} run function gm4_tinker_shamir:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"spiraculum_shamir"} run function gm4_spiraculum_shamir:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"sensus_shamir"} run function gm4_sensus_shamir:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"musical_shamir"} run function gm4_musical_shamir:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"moneo_shamir"} run function gm4_moneo_shamir:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"metallurgy"} run function gm4_metallurgy:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"hypexperia_shamir"} run function gm4_hypexperia_shamir:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"gemini_shamir"} run function gm4_gemini_shamir:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"forterra_shamir"} run function gm4_forterra_shamir:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"ender_bolt_shamir"} run function gm4_ender_bolt_shamir:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"defuse_shamir"} run function gm4_defuse_shamir:guidebook/add_pages
execute if data storage gm4_guidebook:temp module{id:"arborenda_shamir"} run function gm4_arborenda_shamir:guidebook/add_pages
