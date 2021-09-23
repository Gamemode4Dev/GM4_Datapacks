schedule function gm4_animi_shamir:tick 1t

# look for players that just respawned
execute as @e[type=player,scores={gm4_animi_deaths=1..}] at @s run function gm4_animi_shamir:player/upon_respawn
