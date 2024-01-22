# process a found link
# @s = linked player
# at @s
# run from armor/modifier/type/link/process/loop_links

# get highest health between all players, but cannot exceed any players max health
# if a player is joining the link for the first time take their health if it is the lowest
scoreboard players set $link_health gm4_ce_data 0
execute as @a[tag=gm4_ce_linked.process] run function gm4_combat_expanded:player/calculate_hp
execute as @a[tag=gm4_ce_linked.process,tag=gm4_ce_was_linked] run scoreboard players operation $link_health gm4_ce_data > @s gm4_ce_health.current
execute as @a[tag=gm4_ce_linked.process,tag=!gm4_ce_was_linked] run scoreboard players operation $link_health gm4_ce_data < @s gm4_ce_health.current
execute as @a[tag=gm4_ce_linked.process] run scoreboard players operation $link_health gm4_ce_data < @s gm4_ce_health.max

# add the was_linked tag as this player has now been added to a link
tag @s add gm4_ce_was_linked

# set all players to this new health
execute as @a[tag=gm4_ce_linked.process,scores={gm4_ce_health.current=1..}] run function gm4_combat_expanded:armor/modifier/type/link/process/set_health
