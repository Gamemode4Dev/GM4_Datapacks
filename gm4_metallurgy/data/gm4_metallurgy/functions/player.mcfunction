# @s = a player not in spectator
# run from main

tag @s remove gm4_has_spiraculum
tag @s remove gm4_has_arborenda
tag @s remove gm4_has_conduction
tag @s remove gm4_has_tinker
tag @s remove gm4_has_hypexperia
tag @s remove gm4_has_musical
tag @s remove gm4_has_sensus
tag @s remove gm4_has_levity
tag @s remove gm4_has_forterra

execute if predicate gm4_metallurgy:shamir_in_hand at @s[gamemode=!spectator] run function gm4_metallurgy:shamir_in_hand
execute if predicate gm4_metallurgy:shamir_equipped at @s[gamemode=!spectator] run function gm4_metallurgy:shamir_equipped

execute if entity @s[scores={gm4_volt_time=-1..},tag=!gm4_has_conduction] at @s run function gm4_conduction_shamir:deselected_tool

execute if entity @s[tag=!gm4_has_musical] run function gm4_musical_shamir:songs/reset_player
