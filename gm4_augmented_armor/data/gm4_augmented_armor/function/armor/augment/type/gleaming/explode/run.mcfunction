
# particles
particle dust{color:[1.000,1.000,1.000],scale:0.5} ^ ^0.85 ^ 0.3 0.5 0.3 0.25 18
scoreboard players set $particle_ring gm4_aa_data 90
execute rotated 0 0 run function gm4_augmented_armor:armor/augment/type/gleaming/explode/particle_ring_explode

# find owner
function gm4_augmented_armor:armor/augment/type/gleaming/explode/find_owner with entity @s data.gm4_augmented_armor

# explode
execute store result storage gm4_augmented_armor:temp gleaming.reach float 0.1 run scoreboard players get @s gm4_aa_augment.gleaming.reach
execute store result storage gm4_augmented_armor:temp gleaming.damage float 0.1 run scoreboard players get @s gm4_aa_augment.gleaming.damage
function gm4_augmented_armor:armor/augment/type/gleaming/explode/damage with storage gm4_augmented_armor:temp gleaming
data remove storage gm4_augmented_armor:temp gleaming

# remove tag
tag @a remove gm4_aa_augment_damager

# remove marker
kill @s
