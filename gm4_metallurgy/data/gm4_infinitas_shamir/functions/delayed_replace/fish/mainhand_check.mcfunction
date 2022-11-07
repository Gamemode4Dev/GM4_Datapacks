# Checks which fish was picked up
# @s = player holding Water Infinitas in mainhand
# at @s
# run from gm4_infinitas_shamir:delayed_replace/fish

execute store success score @s gm4_infinitas_success_check run item modify entity @s[advancements={gm4_infinitas_shamir:water/pickup_mainhand={pickup_axolotl=true}},predicate=gm4_infinitas_shamir:mainhand/after/pickup/axolotl] weapon.mainhand gm4_infinitas_shamir:set_shamir_nbt
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item modify entity @s[advancements={gm4_infinitas_shamir:water/pickup_mainhand={pickup_cod=true}},predicate=gm4_infinitas_shamir:mainhand/after/pickup/cod] weapon.mainhand gm4_infinitas_shamir:set_shamir_nbt
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item modify entity @s[advancements={gm4_infinitas_shamir:water/pickup_mainhand={pickup_pufferfish=true}},predicate=gm4_infinitas_shamir:mainhand/after/pickup/pufferfish] weapon.mainhand gm4_infinitas_shamir:set_shamir_nbt
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item modify entity @s[advancements={gm4_infinitas_shamir:water/pickup_mainhand={pickup_salmon=true}},predicate=gm4_infinitas_shamir:mainhand/after/pickup/salmon] weapon.mainhand gm4_infinitas_shamir:set_shamir_nbt
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item modify entity @s[advancements={gm4_infinitas_shamir:water/pickup_mainhand={pickup_tadpole=true}},predicate=gm4_infinitas_shamir:mainhand/after/pickup/tadpole] weapon.mainhand gm4_infinitas_shamir:set_shamir_nbt
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item modify entity @s[advancements={gm4_infinitas_shamir:water/pickup_mainhand={pickup_tropical_fish=true}},predicate=gm4_infinitas_shamir:mainhand/after/pickup/tropical_fish] weapon.mainhand gm4_infinitas_shamir:set_shamir_nbt
