# run from armor/modifier/type/link/process/loop_links

# get highest health between all players, but cannot exceed any players max health
scoreboard players set $link_health gm4_ce_data 0
execute as @a[tag=gm4_ce_linked.process] run function gm4_combat_expanded:player/calculate_hp
execute as @a[tag=gm4_ce_linked.process] run scoreboard players operation $link_health gm4_ce_data > @s gm4_ce_health.current
execute as @a[tag=gm4_ce_linked.process] run scoreboard players operation $link_health gm4_ce_data < @s gm4_ce_health.max

# set all players to this new health
execute as @a[tag=gm4_ce_linked.process] run function gm4_combat_expanded:armor/modifier/type/link/process/set_health
