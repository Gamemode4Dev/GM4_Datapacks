# @s = player with an active shamir in their armor slots
# run from player

execute if predicate gm4_metallurgy:defuse_active run function gm4_defuse_shamir:active
execute if predicate gm4_moneo_shamir:wear_chest_moneo run function gm4_moneo_shamir:active_armor_chest
execute if predicate gm4_metallurgy:vibro_active run function gm4_vibro_shamir:active
