
execute store result score $level gm4_aa_data run data get storage gm4_augmented_armor:temp components."minecraft:custom_data".gm4_augmented_armor.levels[0]

# calculate damage x10
scoreboard players operation $damage gm4_aa_data = @s gm4_aa_stat.damage_dealt
scoreboard players operation $damage gm4_aa_data *= $level gm4_aa_data
scoreboard players operation $damage gm4_aa_data /= #100 gm4_aa_data

# if marker was just spawned add damage to it instead (to stack multiple pieces together)
execute if score @s gm4_aa_augment.gleaming.timer = @s gm4_aa_augment.gleaming.timer_full as @n[type=marker,tag=gm4_aa_process_marker.gleaming,distance=..0.01] if score @s gm4_aa_augment.gleaming.timer = @s gm4_aa_augment.gleaming.timer_full run scoreboard players operation @s gm4_aa_augment.gleaming.damage += $damage gm4_aa_data
execute if score @s gm4_aa_augment.gleaming.timer matches 1.. run return 0

# attack reach = 150% of player attack range
execute store result score $attack_reach gm4_aa_data run attribute @s entity_interaction_range get 15

# time to explode based on attack speed
execute store result score $attack_speed gm4_aa_data run attribute @s attack_speed get 100
scoreboard players set $timer gm4_aa_data 8000
scoreboard players operation $timer gm4_aa_data /= $attack_speed gm4_aa_data

# spawn marker
tag @s add gm4_aa_self
execute unless score @s gm4_aa_augment.gleaming.timer matches 1.. summon marker run function gm4_augmented_armor:armor/augment/type/gleaming/prime/init_marker
tag @s remove gm4_aa_self

# set timer before a new gleaming marker can be spawned by this player, 4x the time to explode
# we want to /16 to match speed of main clock and *4, so combine to /4
scoreboard players operation @s gm4_aa_augment.gleaming.timer = $timer gm4_aa_data
scoreboard players operation @s gm4_aa_augment.gleaming.timer /= #4 gm4_aa_data
scoreboard players operation @s gm4_aa_augment.gleaming.timer_full = @s gm4_aa_augment.gleaming.timer
