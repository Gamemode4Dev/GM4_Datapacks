# @s = player with an active shamir in their armor slots
# run from main

execute if predicate gm4_metallurgy:defuse_active run function gm4_defuse_shamir:active
execute if predicate gm4_metallurgy:levity_active run function gm4_levity_shamir:active
