# find everyone linked with this player
# @s = player with link armor
# at unspecified
# run from armor/modifier/type/link/clock
# run from here

scoreboard players set $keep_tick.link gm4_ce_keep_tick 1

# tag self and all players with the same id
scoreboard players operation $curr_id gm4_ce_link_id = @s gm4_ce_link_id
execute as @a[tag=gm4_ce_linked.check] if score @s gm4_ce_link_id = $curr_id gm4_ce_link_id run tag @s add gm4_ce_linked.process

# run link if there are at least 2 players in it and this player is 
execute store result score $link_count gm4_ce_data if entity @a[tag=gm4_ce_linked.process]
execute if score $link_count gm4_ce_data matches 2.. run function gm4_combat_expanded:armor/modifier/type/link/process/run_link

# remove all processed players from the pool
tag @a[tag=gm4_ce_linked.process] remove gm4_ce_linked.check
tag @a[tag=gm4_ce_linked.process] remove gm4_ce_linked.process

# repeat this for players in other links
execute as @p[tag=gm4_ce_linked.check] run function gm4_combat_expanded:armor/modifier/type/link/process/loop_links
