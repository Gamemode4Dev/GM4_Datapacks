# @s = player with an active shamir in their hands
# run from main

execute if predicate gm4_metallurgy:spiraculum_active run function gm4_spiraculum_shamir:active
execute store success score arborenda_active gm4_ml_data run tag @s[predicate=gm4_metallurgy:arborenda_active] add gm4_has_arborenda
execute if predicate gm4_metallurgy:conduction_active run function gm4_conduction_shamir:active
execute if predicate gm4_metallurgy:tinker_active run function gm4_tinker_shamir:active
execute store success score hypexperia_active gm4_ml_data run tag @s[predicate=gm4_metallurgy:hypexperia_active] add gm4_has_hypexperia
execute store success score forterra_active gm4_ml_data run tag @s[predicate=gm4_metallurgy:forterra_active] add gm4_has_forterra
execute if entity @s[scores={gm4_note_collect=1..},predicate=gm4_metallurgy:musical_active] run function gm4_musical_shamir:active
execute if predicate gm4_metallurgy:sensus_active run function gm4_sensus_shamir:active
