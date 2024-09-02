# process players wearing beacon armor
# @s = player
# at @s
# run from clocks/temp/beacon

scoreboard players set $keep_tick.beacon gm4_aa_keep_tick 1

# find this players beacon
scoreboard players operation $player_id gm4_aa_id = @s gm4_aa_id
execute as @e[type=block_display,tag=gm4_aa_beacon.main,distance=..12] if score @s gm4_aa_id = $player_id gm4_aa_id run tag @s add gm4_aa_beacon.process

# if the player does not have a beacon create one
execute unless entity @e[type=block_display,tag=gm4_aa_beacon.process,distance=..12] run function gm4_augmented_armor:armor/augment/type/beacon/spawn

# check if player is sneaking
execute store result score $player_sneaking gm4_aa_data if predicate gm4_augmented_armor:technical/crouching

# process the players beacon
execute as @e[type=block_display,tag=gm4_aa_beacon.process,distance=..12] run function gm4_augmented_armor:armor/augment/type/beacon/process
