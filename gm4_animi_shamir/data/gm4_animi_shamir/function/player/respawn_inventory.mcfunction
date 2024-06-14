# respawns an animi item
# @s = player who has died recently
# at @s
# run from gm4_animi_shamir:player/upon_respawn

# look for entries in cache
data modify storage gm4_animi_shamir:cache prepared_entry.owner set from entity @s UUID
execute store result score $loop gm4_animi_deaths run data get storage gm4_animi_shamir:cache inventories
function gm4_animi_shamir:item_caching/search_entry

# summon item(s)
execute store result score $loop gm4_animi_deaths run data get storage gm4_animi_shamir:cache prepared_entry.inventory
execute if score $loop gm4_animi_deaths matches 1.. run function gm4_animi_shamir:item_caching/unpack_entry

# sound
playsound minecraft:particle.soul_escape player @a[distance=..8] ~ ~ ~ 1 0.7

# remove tag
tag @s remove gm4_animi_user
