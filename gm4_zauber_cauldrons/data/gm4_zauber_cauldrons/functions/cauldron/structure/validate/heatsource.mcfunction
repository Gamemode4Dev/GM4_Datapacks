# @s = zauber cauldron
# at @s
# run from cauldron/structure/validate/liquid

# analyze
function gm4_zauber_cauldrons:cauldron/structure/analyze/heatsource

# enable cauldron for crafting
execute if score $has_heatsource gm4_zc_data matches 1 run function gm4_zauber_cauldrons:cauldron/structure/valid
# TODO ensure correct liquid is in cauldron for recipes
# TODO update creation to accept more heatsources

# reset fake players
scoreboard players reset $has_heatsource gm4_zc_data
scoreboard players reset $has_soul_fire_heatsource gm4_zc_data
