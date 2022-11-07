# Checks which fish was picked up
# @s = player holding Water Infinitas in offhand
# at @s
# run from gm4_infinitas_shamir:delayed_replace/fish

execute store success score @s gm4_infinitas_success_check run item modify entity @s[advancements={gm4_infinitas_shamir:water/pickup_offhand={pickup_axolotl=true}},predicate=gm4_infinitas_shamir:offhand/after/pickup/axolotl] weapon.offhand gm4_infinitas_shamir:set_shamir_nbt
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item modify entity @s[advancements={gm4_infinitas_shamir:water/pickup_offhand={pickup_cod=true}},predicate=gm4_infinitas_shamir:offhand/after/pickup/cod] weapon.offhand gm4_infinitas_shamir:set_shamir_nbt
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item modify entity @s[advancements={gm4_infinitas_shamir:water/pickup_offhand={pickup_pufferfish=true}},predicate=gm4_infinitas_shamir:offhand/after/pickup/pufferfish] weapon.offhand gm4_infinitas_shamir:set_shamir_nbt
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item modify entity @s[advancements={gm4_infinitas_shamir:water/pickup_offhand={pickup_salmon=true}},predicate=gm4_infinitas_shamir:offhand/after/pickup/salmon] weapon.offhand gm4_infinitas_shamir:set_shamir_nbt
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item modify entity @s[advancements={gm4_infinitas_shamir:water/pickup_offhand={pickup_tadpole=true}},predicate=gm4_infinitas_shamir:offhand/after/pickup/tadpole] weapon.offhand gm4_infinitas_shamir:set_shamir_nbt
execute unless score @s gm4_infinitas_success_check matches 1 run item modify entity @s[advancements={gm4_infinitas_shamir:water/pickup_offhand={pickup_tropical_fish=true}},predicate=gm4_infinitas_shamir:offhand/after/pickup/tropical_fish] weapon.offhand gm4_infinitas_shamir:set_shamir_nbt
