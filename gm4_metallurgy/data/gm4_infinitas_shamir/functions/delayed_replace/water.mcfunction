#
#
#
#

execute store success score @s gm4_infinitas_success_check run item replace entity @s[advancements={gm4_infinitas_shamir:water/place_mainhand=true},predicate=gm4_infinitas_shamir:mainhand/after/water] weapon.mainhand with water_bucket
execute if score @s gm4_infinitas_success_check matches 1 run item modify entity @s weapon.mainhand gm4_infinitas_shamir:set_shamir_nbt
execute unless score @s gm4_infinitas_success_check matches 1 store success score @s gm4_infinitas_success_check run item replace entity @s[advancements={gm4_infinitas_shamir:water/place_offhand=true},predicate=gm4_infinitas_shamir:offhand/after/water] weapon.offhand with water_bucket
execute if score @s gm4_infinitas_success_check matches 1 run item modify entity @s weapon.offhand gm4_infinitas_shamir:set_shamir_nbt

advancement revoke @s only gm4_infinitas_shamir:water/place_mainhand
advancement revoke @s only gm4_infinitas_shamir:water/place_offhand

tag @s remove gm4_infinitas_delay_replace_water
