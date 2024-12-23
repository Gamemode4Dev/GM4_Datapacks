# activate armor effects
# @s = arrow shot by player wearing armor
# at @s
# run from armor/augment/type/archery/find_arrow

tag @s add gm4_aa_archery_arrow

data modify storage gm4_augmented_armor:temp archery_arrow set from entity @s {}

# multishot support (spawns half as many arrows)
execute store result score $pickup gm4_aa_data run data get storage gm4_augmented_armor:temp archery_arrow.pickup
execute unless score $pickup gm4_aa_data matches 1..2 run scoreboard players operation $archery_arrow_target gm4_aa_data /= #2 gm4_aa_data

function gm4_augmented_armor:armor/augment/type/archery/spawn_arrows
data remove storage gm4_augmented_armor:temp archery_arrow
