# Upgrade legacy flower pot plant to current gm4 version
# @s = type=minecraft:marker, tag=rc_blossoming_pots.flowerPot
# at @s
# run from upgrade_paths/3.1 and decorated/as_player and flower/as_player and vanilla_pot_handling/as_player


# Note: legacy pot displays are located at align xyz positioned ~.5 ~ ~.5, different from current version.

# clear temp just in case
data remove storage gm4_blossoming_pots:flower_pots temp

# grab item id
data modify storage gm4_blossoming_pots:flower_pots temp.id set from entity @s data.id
data modify storage gm4_blossoming_pots:flower_pots temp.legacy.id set from storage gm4_blossoming_pots:flower_pots temp.id

# grab Rotation from block display tag=rc_blossoming_pots.flowerPotPlant0
data modify storage gm4_blossoming_pots:flower_pots temp.rotation set from entity @e[type=minecraft:block_display,tag=rc_blossoming_pots.flowerPotPlant0,distance=..0.1,limit=1] Rotation[0]

# kill all block displays for this plant
kill @e[type=minecraft:block_display,tag=rc_blossoming_pots.flowerPotPlant,distance=..0.1]

# drop items of id and count-1
execute store result score $count gm4_blossoming_pots.misc run data get entity @s data.count
execute store result storage gm4_blossoming_pots:flower_pots temp.legacy.count int 1 run scoreboard players remove $count gm4_blossoming_pots.misc 1
execute unless score $count gm4_blossoming_pots.misc matches ..0 positioned ~ ~.5 ~ run function gm4_blossoming_pots:flower/cleanup with storage gm4_blossoming_pots:flower_pots temp.legacy

# We need to check using a macro function if the id stored in @s data is in storage, and if not then drop item with cleanup
function gm4_blossoming_pots:upgrade_paths/3.1/check_legacy_flower_pot_in_storage with storage gm4_blossoming_pots:flower_pots temp.legacy

# set legacy count back to 1 for potential clean up
data modify storage gm4_blossoming_pots:flower_pots temp.legacy.count set value 1

# if legacy plant IS NOT in modern storage, clean up @s and drop items using legacy storage
execute positioned ~ ~.5 ~ unless score $legacy_in_storage gm4_blossoming_pots.misc matches 1 run \
    return run function gm4_blossoming_pots:flower/cleanup with storage gm4_blossoming_pots:flower_pots temp.legacy

# if legacy plant IS in modern storage, summon new displays and perma marker using @s as a temp entity
execute positioned ~ ~.5 ~ if score $legacy_in_storage gm4_blossoming_pots.misc matches 1 run \
    return run function gm4_blossoming_pots:flower/prepare_data with storage gm4_blossoming_pots:flower_pots temp

# @s is killed in both return runs
