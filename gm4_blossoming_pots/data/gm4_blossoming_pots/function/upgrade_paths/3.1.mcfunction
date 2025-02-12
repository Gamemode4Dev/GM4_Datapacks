# Rough outline for upgrade path
# @s = player
# at @s


# upgrade legacy flower pots
execute as @e[type=minecraft:marker,tag=rc_blossoming_pots.flowerPot] at @s \
    run function gm4_blossoming_pots:upgrade_paths/3.1/legacy_flower_pot

# upgrade legacy decorated pots
execute as @e[type=minecraft:block_display,tag=rc_blossoming_pots.decorPotPlant0] at @s \
    run function gm4_blossoming_pots:upgrade_paths/3.1/legacy_decorated_pot


# not cleaning up legacy storage, sorry. Its like 20KB, 190 storage keys.
# not worth it to clean all the storage keys, when we cant delete the files
# Just leaving the files there for world owners to clean up if they really want to
