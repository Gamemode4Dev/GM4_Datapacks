# quaternary search tree based on string length
# run from gm4_animi_shamir:smooshing/tree_start

# split at ~25%
execute if score $len gm4_animi_deaths matches ..16 run function gm4_animi_shamir:smooshing/tree_i_16
execute if score $len gm4_animi_deaths matches 17 run function gm4_animi_shamir:smooshing/tree_17
execute if score $len gm4_animi_deaths matches 18 run function gm4_animi_shamir:smooshing/tree_18
execute if score $len gm4_animi_deaths matches 19 run function gm4_animi_shamir:smooshing/tree_19
