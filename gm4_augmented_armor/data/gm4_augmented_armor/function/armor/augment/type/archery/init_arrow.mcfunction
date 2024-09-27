# set storm arrow data
# @s = storm arrow
# at unspecified
# run from armor/augment/type/archery/spawn_arrows

# slightly adjust arrow motion
data modify storage gm4_augmented_armor:temp archery_arrow.Motion_adj set value [0.0d,0.0d,0.0d] 

execute store result score $mot_adjust gm4_aa_data run random value -32..32
execute store result score $mot gm4_aa_data run data get storage gm4_augmented_armor:temp archery_arrow.Motion[0] 100
execute store result storage gm4_augmented_armor:temp archery_arrow.Motion_adj[0] double 0.01 run scoreboard players operation $mot gm4_aa_data += $mot_adjust gm4_aa_data

execute store result score $mot_adjust gm4_aa_data run random value -10..10
execute store result score $mot gm4_aa_data run data get storage gm4_augmented_armor:temp archery_arrow.Motion[1] 100
execute store result storage gm4_augmented_armor:temp archery_arrow.Motion_adj[1] double 0.01 run scoreboard players operation $mot gm4_aa_data += $mot_adjust gm4_aa_data

execute store result score $mot_adjust gm4_aa_data run random value -32..32
execute store result score $mot gm4_aa_data run data get storage gm4_augmented_armor:temp archery_arrow.Motion[2] 100
execute store result storage gm4_augmented_armor:temp archery_arrow.Motion_adj[2] double 0.01 run scoreboard players operation $mot gm4_aa_data += $mot_adjust gm4_aa_data

# use reduced damage
execute store result entity @s damage double 0.1 run scoreboard players get $arrow_damage gm4_sr_data

# set arrow data
data modify entity @s Motion set from storage gm4_augmented_armor:temp archery_arrow.Motion_adj
data modify entity @s Rotation set from storage gm4_augmented_armor:temp archery_arrow.Rotation
data modify entity @s crit set from storage gm4_augmented_armor:temp archery_arrow.crit
data modify entity @s Fire set from storage gm4_augmented_armor:temp archery_arrow.Fire
data modify entity @s Owner set from storage gm4_augmented_armor:temp archery_arrow.Owner
data modify entity @s item.components set from storage gm4_augmented_armor:temp archery_arrow.item.components

tag @s add gm4_aa_archery_arrow
tag @s add gm4_sr_arrow_checked
