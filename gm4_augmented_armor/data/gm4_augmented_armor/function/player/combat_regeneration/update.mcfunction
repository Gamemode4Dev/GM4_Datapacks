# process a player that had their combat regeneration timer reset
# @s = player
# at @s

scoreboard players reset $update.combat_regeneration gm4_aa_data

function gm4_augmented_armor:player/combat_regeneration/on_timer_set
scoreboard players operation @s gm4_sr_combat_regen_timer < $set gm4_sr_combat_regen_timer
