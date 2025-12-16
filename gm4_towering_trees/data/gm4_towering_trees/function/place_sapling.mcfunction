# Initiates the search for the placed sapling
# @s = player that just placed a custom sapling
# at @s
advancement revoke @s only gm4_towering_trees:place_sapling

# have to engage lib_trees from here since this module works with vanilla saplings
function #gm4_trees:place_sapling
