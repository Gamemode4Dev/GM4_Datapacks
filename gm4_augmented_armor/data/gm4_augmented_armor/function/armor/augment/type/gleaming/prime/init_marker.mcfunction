
data modify entity @s data.gm4_augmented_armor.UUID set from entity @p[tag=gm4_aa_self] UUID

tag @s add gm4_aa_process_marker.tick
tag @s add gm4_aa_process_marker.gleaming

# set reach
scoreboard players operation @s gm4_aa_augment.gleaming.reach = $attack_reach gm4_aa_data

# set damage
scoreboard players operation @s gm4_aa_augment.gleaming.damage = $damage gm4_aa_data

# set time to explode
scoreboard players operation @s gm4_aa_augment.gleaming.timer = $timer gm4_aa_data
scoreboard players operation @s gm4_aa_augment.gleaming.timer_full = @s gm4_aa_augment.gleaming.timer
