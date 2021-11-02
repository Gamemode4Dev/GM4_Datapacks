# adds a prepared entry to the cache
# @s = a player who has died whilst carrying animi items
# run from gm4_animi_shamir:player/upon_death

# read player data
data modify storage gm4_animi_shamir:cache prepared_entry.owner set from entity @s UUID

# read inventory
data modify storage gm4_animi_shamir:cache inventories append from storage gm4_animi_shamir:cache prepared_entry

# remember that this player died with animi items
tag @s add gm4_animi_user

# sound
playsound minecraft:particle.soul_escape player @a[distance=..8] ~ ~ ~ 1 0.7

# wait for respawn
function gm4_animi_shamir:player/wait_for_respawn
