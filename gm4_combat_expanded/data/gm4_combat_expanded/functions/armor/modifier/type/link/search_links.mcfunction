# find link this armor belongs to or make a new one
# @s = player wearing link armor
# at @s
# run from armor/modifier/type/link/check

# grab id from storage if it already exists
$execute store result score @s gm4_ce_link_id run data get storage gm4_combat_expanded:temp active_links[{name:$(Name)}].id

# if an id was found no need to put a new entry in storage
execute unless score @s gm4_ce_link_id matches 0 run return 1

# put the new name into storage
$data modify storage gm4_combat_expanded:temp new_link set value {id:0,name:$(Name)}
execute store result storage gm4_combat_expanded:temp new_link.id int 1 run scoreboard players add $latest_id gm4_ce_link_id 1
data modify storage gm4_combat_expanded:temp active_links append from storage gm4_combat_expanded:temp new_link
data remove storage gm4_combat_expanded:temp new_link

scoreboard players operation @s gm4_ce_link_id = $latest_id gm4_ce_link_id
