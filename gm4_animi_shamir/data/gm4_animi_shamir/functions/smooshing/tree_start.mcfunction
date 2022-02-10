# start of a binary search tree based on string length
# run from #gm4_animi_shamir:mark_item_validity

# obtain item id
data modify storage gm4_animi_shamir:smooshing/target_item id set from entity @s Item.id

# obtain id length
scoreboard players reset $len gm4_animi_deaths
execute store result score $len gm4_animi_deaths run data get storage gm4_animi_shamir:smooshing/target_item id

# split at ~25%
execute if score $len gm4_animi_deaths matches ..19 run function gm4_animi_shamir:smooshing/tree_i_19
execute if score $len gm4_animi_deaths matches 20..22 run function gm4_animi_shamir:smooshing/tree_20_22
execute if score $len gm4_animi_deaths matches 23..24 run function gm4_animi_shamir:smooshing/tree_23_24
execute if score $len gm4_animi_deaths matches 25.. run function gm4_animi_shamir:smooshing/tree_25_i

# reset storage
data remove storage gm4_animi_shamir:smooshing/target_item id
