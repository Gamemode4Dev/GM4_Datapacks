# process players wearing radiant armor
# @s = player
# at @s
# run from clocks/temp/radiant

scoreboard players set $keep_tick.radiant gm4_aa_keep_tick 1

# find this players radiant
scoreboard players operation $player_id gm4_aa_id = @s gm4_aa_id
execute as @e[type=block_display,tag=gm4_aa_radiant.main,distance=..12] if score @s gm4_aa_id = $player_id gm4_aa_id run tag @s add gm4_aa_radiant.process

# if the player does not have a radiant create one
execute unless entity @e[type=block_display,tag=gm4_aa_radiant.process,distance=..12] run function gm4_augmented_armor:armor/augment/type/radiant/spawn

# check if player is sneaking
execute store result score $player_sneaking gm4_aa_data if predicate gm4_augmented_armor:technical/crouching

# process the players radiant
execute as @e[type=block_display,tag=gm4_aa_radiant.process,distance=..12] run function gm4_augmented_armor:armor/augment/type/radiant/process
