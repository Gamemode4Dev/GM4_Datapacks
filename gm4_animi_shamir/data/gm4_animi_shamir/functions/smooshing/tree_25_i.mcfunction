# quaternary search tree based on string length
# run from gm4_animi_shamir:smooshing/tree_start

# split at ~25%
execute if score $len gm4_animi_deaths matches 25 run function gm4_animi_shamir:smooshing/tree_25
execute if score $len gm4_animi_deaths matches 26 run function gm4_animi_shamir:smooshing/tree_26
execute if score $len gm4_animi_deaths matches 27 run function gm4_animi_shamir:smooshing/tree_27
execute if score $len gm4_animi_deaths matches 28.. run function gm4_animi_shamir:smooshing/tree_28_i
