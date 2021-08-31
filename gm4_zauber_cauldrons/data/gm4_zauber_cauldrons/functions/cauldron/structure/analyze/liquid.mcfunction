# @s = zauber cauldron
# at @s
# run from cauldron/structure/validate/liquid and cauldron/setup/validate_structure
# fake players must be reset after the result of this function was evaluated

# analyze type of cauldron used
execute store success score $has_liquid gm4_zc_data store success score $has_water gm4_zc_data if block ~ ~ ~ minecraft:water_cauldron
execute unless score $has_liquid gm4_zc_data matches 1 store success score $has_liquid gm4_zc_data store success score $has_powder_snow gm4_zc_data if block ~ ~ ~ minecraft:powder_snow_cauldron
execute unless score $has_liquid gm4_zc_data matches 1 store success score $has_liquid gm4_zc_data store success score $has_lava gm4_zc_data if block ~ ~ ~ minecraft:lava_cauldron
