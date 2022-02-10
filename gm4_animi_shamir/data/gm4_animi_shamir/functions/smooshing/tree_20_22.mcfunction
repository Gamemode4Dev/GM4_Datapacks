# quaternary search tree based on string length
# run from gm4_animi_shamir:smooshing/tree_start

# split at ~25%
execute if score $len gm4_animi_deaths matches 20 run function gm4_animi_shamir:smooshing/tree_20
execute if score $len gm4_animi_deaths matches 21 run function gm4_animi_shamir:smooshing/tree_21
execute if score $len gm4_animi_deaths matches 22 run function gm4_animi_shamir:smooshing/tree_22
