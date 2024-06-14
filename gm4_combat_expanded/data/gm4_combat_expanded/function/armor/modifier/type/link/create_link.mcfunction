# find link this armor belongs to or make a new one
# @s = player wearing link armor
# at @s
# run from armor/modifier/type/link/check

# put the new link into storage
data modify storage gm4_combat_expanded:temp new_link set value {id:0,health:1,max_health:20,name:null}
data modify storage gm4_combat_expanded:temp new_link.name set from storage gm4_combat_expanded:temp components."minecraft:custom_name"
execute store result storage gm4_combat_expanded:temp new_link.id int 1 run scoreboard players add $latest_id gm4_ce_link_id 1
execute store result storage gm4_combat_expanded:temp new_link.health int 1 run scoreboard players get @s gm4_ce_health.current
data modify storage gm4_combat_expanded:data active_links append from storage gm4_combat_expanded:temp new_link
data remove storage gm4_combat_expanded:temp new_link

# set player link id to this link
scoreboard players operation @s gm4_ce_link_id = $latest_id gm4_ce_link_id
