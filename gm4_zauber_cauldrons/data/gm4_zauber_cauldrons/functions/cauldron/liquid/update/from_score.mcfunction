# loads the liquid level into the blockstate of the cauldron from its liquid level score
# @s = zauber cauldron
# at @s align xyz
# run from cauldron/structure/analyze/liquid and recipes which need to update the liquid level

execute if score @s gm4_zc_liquid_level matches 0 run function gm4_zauber_cauldrons:cauldron/liquid/update/level_0/set
execute if score @s gm4_zc_liquid_level matches 1 run function gm4_zauber_cauldrons:cauldron/liquid/update/level_1/set
execute if score @s gm4_zc_liquid_level matches 2 run function gm4_zauber_cauldrons:cauldron/liquid/update/level_2/set
execute if score @s gm4_zc_liquid_level matches 3 run function gm4_zauber_cauldrons:cauldron/liquid/update/level_3/set
