# @s = non-spectator, non-adventure players, looking at a non-zauber cauldron, holding an enchanted book
# at cauldron being looked at, align xyz
# run from player/submain

# analyze structure
function gm4_zauber_cauldrons:cauldron/structure/analyze/liquid
execute if score $has_liquid gm4_zc_data matches 1 run function gm4_zauber_cauldrons:cauldron/structure/analyze/heatsource

# create zauber cauldron if structure is valid
execute if score $has_heatsource gm4_zc_data matches 1 run function gm4_zauber_cauldrons:cauldron/setup/create

# reset fake players
scoreboard players reset $has_liquid gm4_zc_data
scoreboard players reset $has_water gm4_zc_data
scoreboard players reset $has_powder_snow gm4_zc_data
scoreboard players reset $has_lava gm4_zc_data
scoreboard players reset $has_heatsource gm4_zc_data
scoreboard players reset $has_soul_fire_heatsource gm4_zc_data
