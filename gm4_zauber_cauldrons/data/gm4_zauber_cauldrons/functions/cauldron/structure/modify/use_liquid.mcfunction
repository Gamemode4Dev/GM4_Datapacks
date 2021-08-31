# @s = zauber cauldron
# should be at @s
# run from cauldron/structure/modify

# check liquid type
execute if score $has_water gm4_zc_data matches 1 run function gm4_zauber_cauldrons:cauldron/structure/modify/use_water
execute if score $has_powder_snow gm4_zc_data matches 1 run function gm4_zauber_cauldrons:cauldron/structure/modify/use_powder_snow
