# Checks which fish was picked up
# @s = player holding Water Infinitas in mainhand
# at @s
# run from gm4_infinitas_shamir:delayed_replace/fish

execute store success score @s gm4_infinitas_success_check run item replace entity @s[predicate=gm4_infinitas_shamir:mainhand/after/pickup/axolotl] weapon.mainhand with axolotl_bucket
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item replace entity @s[predicate=gm4_infinitas_shamir:mainhand/after/pickup/cod] weapon.mainhand with cod_bucket
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item replace entity @s[predicate=gm4_infinitas_shamir:mainhand/after/pickup/pufferfish] weapon.mainhand with pufferfish_bucket
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item replace entity @s[predicate=gm4_infinitas_shamir:mainhand/after/pickup/salmon] weapon.mainhand with salmon_bucket
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item replace entity @s[predicate=gm4_infinitas_shamir:mainhand/after/pickup/tadpole] weapon.mainhand with tadpole_bucket
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item replace entity @s[predicate=gm4_infinitas_shamir:mainhand/after/pickup/tropical_fish] weapon.mainhand with tropical_fish_bucket

execute if score @s gm4_infinitas_success_check matches 1 run item modify entity @s weapon.mainhand gm4_infinitas_shamir:restore_shamir
