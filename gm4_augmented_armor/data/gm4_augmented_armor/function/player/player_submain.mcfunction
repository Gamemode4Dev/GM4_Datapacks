# process anything player related
# @s = unspecified
# at unspecified
# run from base survival_refightalized module, from function clocks/player_submain

# prep link armor
scoreboard players set $link.calc_max_health gm4_aa_data 1
tag @a remove gm4_aa_linked
scoreboard players reset @a gm4_aa_augment.link.id

# process players
execute as @a[gamemode=!spectator] run function gm4_augmented_armor:player/process

# linked armor after player processing
tag @a[tag=!gm4_aa_linked] remove gm4_aa_was_linked

# apply horse speed effect
execute as @a on vehicle if score @s gm4_aa_augment.equestrian.speed_level matches 1.. run function gm4_augmented_armor:armor/augment/type/horse/apply_effect

# timers
scoreboard players remove @a[scores={gm4_aa_in_combat=1..}] gm4_aa_in_combat 1
scoreboard players remove @a[scores={gm4_aa_augment.canine.timer=1..}] gm4_aa_augment.canine.timer 1
scoreboard players remove @a[scores={gm4_aa_augment.soothe.timer=1..}] gm4_aa_augment.soothe.timer 1
scoreboard players remove @a[scores={gm4_aa_augment.gleaming.timer=1..}] gm4_aa_augment.gleaming.timer 1
scoreboard players remove @a[scores={gm4_aa_augment.berserkers.timer=1..}] gm4_aa_augment.berserkers.timer 1
scoreboard players remove @a[scores={gm4_aa_in_pvp=1..}] gm4_aa_in_pvp 1

# reset scoreboards
scoreboard players reset @a gm4_aa_stat.damage_taken
scoreboard players reset @a gm4_aa_stat.kills
scoreboard players reset @a gm4_aa_stat.kills_add
scoreboard players reset @a gm4_aa_stat.damage_dealt
scoreboard players reset @a gm4_aa_stat.damage_dealt_add
scoreboard players reset @a gm4_aa_stat.sprint_one_cm
scoreboard players reset @a gm4_aa_stat.swim_one_cm
