# process player
# @s = online player
# at unspecified
# run from player/player_submain

# add player kills and mob kills together
scoreboard players operation @s gm4_aa_stat.kills += @s gm4_aa_stat.kills_add
# add red heart and absorption damage together
scoreboard players operation @s gm4_aa_stat.damage_dealt += @s gm4_aa_stat.damage_dealt_add

# remove husk sprint score if player didn't sprint for too long
##execute unless score @s gm4_aa_stat.sprint_one_cm matches 1.. run scoreboard players add @s[scores={gm4_aa_augment.dashing.timer=1..}] gm4_aa_augment.dashing.timeout 1
##scoreboard players reset @s[scores={gm4_aa_augment.dashing.timeout=3..,gm4_aa_augment.dashing.timer=1..}] gm4_aa_augment.dashing.timer
##scoreboard players reset @s gm4_aa_augment.dashing.pieces_equipped

# remove tags
##tag @s remove gm4_aa_linked
execute if entity @s[tag=gm4_aa_effect_immunity.active] run function gm4_augmented_armor:player/clear_immunities

# process armor augments
execute if items entity @s armor.* #gm4_survival_refightalized:armor[custom_data~{gm4_augmented_armor:{}}] at @s run function gm4_augmented_armor:armor/trigger/clocked

# remove second wind tag if armor is taken off
##tag @s[tag=gm4_aa_augment.rejuvenating.stored_health.active,predicate=!gm4_augmented_armor:modified_armor/second_wind] remove gm4_aa_augment.rejuvenating.stored_health.active
