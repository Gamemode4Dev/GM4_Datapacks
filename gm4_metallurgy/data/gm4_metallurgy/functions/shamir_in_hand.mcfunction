# @s = player with an active shamir in their hands
# run from player

execute if predicate gm4_metallurgy:arborenda_active run function gm4_arborenda_shamir:active
execute if predicate gm4_metallurgy:conduction_active run function gm4_conduction_shamir:active
execute if predicate gm4_metallurgy:hypexperia_active run function gm4_hypexperia_shamir:active
execute if entity @s[scores={gm4_note_collect=1..},predicate=gm4_metallurgy:musical_active] run function gm4_musical_shamir:active
execute if predicate gm4_metallurgy:sensus_active run function gm4_sensus_shamir:active
execute if predicate gm4_metallurgy:spiraculum_active run function gm4_spiraculum_shamir:active
execute if predicate gm4_metallurgy:tinker_active run function gm4_tinker_shamir:active
