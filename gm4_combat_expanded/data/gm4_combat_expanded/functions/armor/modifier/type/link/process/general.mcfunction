# process link
# @s = unspecified
# at unspecified
# run from tick

# get health from all linked players
execute as @a[tag=gm4_ce_linked] run function gm4_combat_expanded:player/calculate_hp

# if this link is new establish a baseline health goal (taken from the lowest health player)
execute unless score $link.active gm4_ce_data matches 1.. run function gm4_combat_expanded:armor/modifier/type/link/process/establish

# if link already exists take the highest health between players
execute if score $link.active gm4_ce_data matches 1.. as @a[tag=gm4_ce_linked] run scoreboard players operation $link.health gm4_ce_data > @s gm4_ce_health

# mark link as active to enable damage advancements
scoreboard players set $link.active gm4_ce_data 2

# set all players to this new health
execute as @a[tag=gm4_ce_linked] run function gm4_combat_expanded:armor/modifier/type/link/process/set_health
