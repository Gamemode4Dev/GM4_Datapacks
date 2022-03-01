# quaternary search tree based on string length
# run from gm4_animi_shamir:smooshing/tree_start

# split at ~25%
execute if score $len gm4_animi_deaths matches 23 run function gm4_animi_shamir:smooshing/tree_23
execute if score $len gm4_animi_deaths matches 24 run function gm4_animi_shamir:smooshing/tree_24
