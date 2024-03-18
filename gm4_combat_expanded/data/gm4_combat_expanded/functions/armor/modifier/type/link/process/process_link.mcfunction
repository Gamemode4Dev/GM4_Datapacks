# process a link with 2+ players
# @s = unspecified
# at unspecified
# run from armor/modifier/type/link/process/loop_links

scoreboard players set $keep_tick.link gm4_ce_keep_tick 1

# grab link health from last tick
execute store result score $link_health gm4_ce_data run data get storage gm4_combat_expanded:temp run_links[0].health

# get average max health of all players in this link once per 16t
execute if score $link.calc_max_health gm4_ce_data matches 1 run function gm4_combat_expanded:armor/modifier/type/link/process/calc_max_health
execute if score $link.calc_max_health gm4_ce_data matches 0 store result score $link_max_health gm4_ce_data run data get storage gm4_combat_expanded:temp run_links[0].max_health

# all player already in this link modify link health by their health change since last tick
scoreboard players operation $link_health_start gm4_ce_data = $link_health gm4_ce_data
execute as @a[tag=gm4_ce_link.process,tag=gm4_ce_was_linked] run function gm4_combat_expanded:armor/modifier/type/link/process/calc_health_change

# make sure link health does not exceed any link max health
scoreboard players operation $link_health gm4_ce_data < $link_max_health gm4_ce_data

# any new player will keep the link health below theirs so link never heals a player
execute as @a[tag=gm4_ce_link.process,tag=!gm4_ce_was_linked] run scoreboard players operation $link_health gm4_ce_data < @s gm4_ce_health.current
tag @a[tag=gm4_ce_link.process,tag=!gm4_ce_was_linked] add gm4_ce_was_linked

# process health set or death
execute if score $link_health gm4_ce_data matches 1.. as @a[tag=gm4_ce_link.process] run function gm4_combat_expanded:armor/modifier/type/link/process/set_health
execute unless score $link_health gm4_ce_data matches 1.. run function gm4_combat_expanded:armor/modifier/type/link/process/death

# store the new health total in storage, make sure there is at least some health in case new players join
execute store result storage gm4_combat_expanded:temp run_links[0].health int 1 run scoreboard players operation $link_health gm4_ce_data > #1 gm4_ce_data

# add this link back to storage to keep it for next tick
data modify storage gm4_combat_expanded:temp rebuild_links append from storage gm4_combat_expanded:temp run_links[0]
