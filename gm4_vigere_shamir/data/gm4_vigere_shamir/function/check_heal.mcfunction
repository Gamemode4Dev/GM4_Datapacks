# checks for players who have recently healed from Vigere and removes the attributes from gm4_vigere_shamir:heal
# run from main

execute as @a[tag=gm4_vs_healed] run function gm4_vigere_shamir:revert_health
