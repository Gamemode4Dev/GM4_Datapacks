# search links for the one this player belongs to
# @s = player wearing link armor
# at @s
# run from armor/modifier/type/link/check
# run from here

# check first link in list to see if name matches
data modify storage gm4_combat_expanded:temp search_links.check_name set from storage gm4_combat_expanded:temp search_links.list[0].name
execute store success score $wrong_link gm4_ce_data run data modify storage gm4_combat_expanded:temp search_links.check_name set from storage gm4_combat_expanded:temp search_links.find_name

# if link was found return
execute if score $wrong_link gm4_ce_data matches 0 run return 1

# if link was not found check next link in list
data remove storage gm4_combat_expanded:temp search_links.list[0]
execute if data storage gm4_combat_expanded:temp search_links.list[0] run function gm4_combat_expanded:armor/modifier/type/link/search_links
