# loop through links
# @s = unspecified
# at unspecified
# run from clocks/temp/link

# grab id of this link
execute store result score $link_id gm4_ce_link_id run data get storage gm4_combat_expanded:temp run_links[0].id

# look for players in this link
execute as @a[tag=gm4_ce_linked,gamemode=!spectator,gamemode=!creative] if score @s gm4_ce_link_id = $link_id gm4_ce_link_id run tag @s add gm4_ce_link.process
execute store result score $link_players gm4_ce_data if entity @a[tag=gm4_ce_link.process]
execute if score $link_players gm4_ce_data matches 1 as @p[tag=gm4_ce_link.process] run function gm4_combat_expanded:armor/modifier/type/link/process/one_player_link
execute if score $link_players gm4_ce_data matches 2.. run function gm4_combat_expanded:armor/modifier/type/link/process/process_link

# check for more links
data remove storage gm4_combat_expanded:temp run_links[0]
execute if data storage gm4_combat_expanded:temp run_links[0] run function gm4_combat_expanded:armor/modifier/type/link/process/loop_links
