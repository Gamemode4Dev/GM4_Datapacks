# Active if a player died with an animi item. Self-schedules until that player either logs out or respawns.
# @s = none
# at world spawn
# self schduled or run from gm4_animi_shamir:item_caching/add_entry or gm4_animi_shamir:player/rejoin

# look for players that just respawned (@e only selects living entities)
execute as @e[type=player,scores={gm4_animi_deaths=1..}] at @s run function gm4_animi_shamir:player/upon_respawn

# reschedule if there is a player (dead or alive) with a gm4_animi_deaths score (@a also selects dead players)
execute if entity @p[scores={gm4_animi_deaths=1..}] run schedule function gm4_animi_shamir:player/wait_for_respawn 1t
