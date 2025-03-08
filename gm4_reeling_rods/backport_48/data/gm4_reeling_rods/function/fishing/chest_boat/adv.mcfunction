# Initial Logic for rod reeling chest_boat
# @s = player who fished
# at @s
# run from advancement gm4_reeling_rods:fishing/chest_boat

advancement revoke @s only gm4_reeling_rods:fishing/chest_boat

function gm4_reeling_rods:store_player_pos

tag @s add gm4_reeling_rods.player

execute as @e[type=minecraft:fishing_bobber,distance=..33] \
    if function gm4_reeling_rods:fishing/owns_bobber \
    at @s positioned ~ ~-0.45 ~ \
    as @e[type=minecraft:chest_boat,distance=..0.00001,limit=1] \
    unless data entity @s {Invulnerable:1b} unless data entity @s Tags[] \
    run function gm4_reeling_rods:fishing/chest_boat/action

tag @s remove gm4_reeling_rods.player
