# @s = zauber cauldron
# at @s align xyz
# run from cauldron/structure/validate/liquid

# analyze
function gm4_zauber_cauldrons:cauldron/structure/analyze/heatsource

# enable cauldron for crafting
execute if score $has_heatsource gm4_zc_data matches 1 unless score $has_lava gm4_zc_data matches 1 run function gm4_zauber_cauldrons:cauldron/structure/valid

# reset fake players
scoreboard players reset $has_heatsource gm4_zc_data
scoreboard players reset $has_soul_fire_heatsource gm4_zc_data
