# process a player that took damage (after damage is processed)
# @s = damaged player
# at @s
# run from base survival_refightalized module, from function player/health/damaged/run

# set the player to be in combat for ~10 seconds
scoreboard players set @s[advancements={gm4_survival_refightalized:damaged={combat_damage=true}}] gm4_aa_in_combat 13

# trigger augments that run from taking damage
execute if entity @s[predicate=gm4_augmented_armor:modified_armor/generic_damage_taken] run function gm4_augmented_armor:armor/trigger/damage_taken
