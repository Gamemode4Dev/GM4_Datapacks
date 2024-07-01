# runs once a player has respawned
# @s a player that died and has now respawned
# at @s
# run from gm4_animi_shamir:player/wait_for_respawn

# reset score and advancement
advancement revoke @s only gm4_animi_shamir:death
scoreboard players reset @s gm4_animi_deaths

# return animi item(s) if this player had at least one animi item
execute if entity @s[tag=gm4_animi_user,gamemode=!spectator] run function gm4_animi_shamir:player/respawn_inventory
