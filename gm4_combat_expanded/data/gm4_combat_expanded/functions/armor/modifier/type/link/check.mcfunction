# activate link for this player
# @s = player wearing link armor
# at @s
# run from armor/modifier/check_modifier/equip

# check if armor has been given a new custom name
execute store result score $name_len gm4_ce_data run data get storage gm4_combat_expanded:temp tag.display.Name
execute if score $name_len gm4_ce_data matches ..55 run function gm4_combat_expanded:armor/modifier/type/link/format_name with storage gm4_combat_expanded:temp tag.display

# if this player is already in an active link do not continue
execute if entity @s[scores={gm4_ce_link_id=1..}] run return 0

# check if this name is already in an active link and grab id
function gm4_combat_expanded:armor/modifier/type/link/search_links with storage gm4_combat_expanded:temp tag.display

# tag player as wearing this armor
tag @s[gamemode=!creative] add gm4_ce_linked

# start clock
schedule function gm4_combat_expanded:armor/modifier/type/link/clock 1t
