# Upgrade legacy decorated pot plant to current gm4 version
# @s = type=minecraft:block_display, tag=rc_blossoming_pots.decorPotPlant0
# at @s
# run from upgrade_paths/3.1 and decorated/as_player and flower/as_player and vanilla_pot_handling/as_player


# Note: legacy pot displays are located at align xyz positioned ~.5 ~ ~.5, different from current version.

# clear temp just in case
data remove storage gm4_blossoming_pots:decorated_pots temp

# kill all other displays distance =..0.1
kill @e[type=minecraft:block_display,tag=rc_blossoming_pots.decorPotPlant,tag=!rc_blossoming_pots.decorPotPlant0,distance=..0.1]
# if pot is now empty, kill @s and return. Cleanup complete
execute unless data block ~ ~ ~ item run return run kill @s

# grab Rotation from @s
data modify storage gm4_blossoming_pots:decorated_pots temp.rotation set from entity @s Rotation[0]

# pivot to decorated/set_count using rc_blossoming_pots.decorPotPlant0 as the temp entity, which is killed in set_count after displays are set
execute positioned ~ ~.5 ~ run function gm4_blossoming_pots:decorated/set_count with block ~ ~ ~ item
