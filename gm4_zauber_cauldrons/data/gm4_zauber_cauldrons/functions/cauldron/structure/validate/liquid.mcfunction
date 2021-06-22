# @s = zauber cauldron
# at @s
# run from cauldron/structure/check

# reset rabbit target score (set to 1 in cauldron/structure/analyze/cauldron if an empty cauldron is present)
scoreboard players set @s gm4_zc_rabtarget 0

# analyze
function gm4_zauber_cauldrons:cauldron/structure/analyze/liquid

# check for heat source if $has_liquid == true
execute if score $has_liquid gm4_zc_data matches 1 run function gm4_zauber_cauldrons:cauldron/structure/validate/heatsource

# if no liquid was found, check for existence of empty cauldron
execute unless score $has_liquid gm4_zc_data matches 1 run function gm4_zauber_cauldrons:cauldron/structure/validate/cauldron

# reset fake players
scoreboard players reset $has_liquid gm4_zc_data
scoreboard players reset $has_water gm4_zc_data
scoreboard players reset $has_powder_snow gm4_zc_data
scoreboard players reset $has_lava gm4_zc_data
