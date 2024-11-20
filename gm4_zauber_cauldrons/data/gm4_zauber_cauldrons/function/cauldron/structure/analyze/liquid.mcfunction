# @s = zauber cauldron
# at @s align xyz
# run from cauldron/structure/validate/liquid and cauldron/setup/validate_structure
# fake players must be reset after the result of this function was evaluated

# analyze type of cauldron used
execute if score @s gm4_zc_liquid_level matches 0..3 run function gm4_zauber_cauldrons:cauldron/liquid/update/from_score
execute if score @s gm4_zc_liquid_level matches 1..3 run scoreboard players set $has_liquid gm4_zc_data 1
execute unless score $has_liquid gm4_zc_data matches 1 store success score $has_liquid gm4_zc_data store success score $has_water gm4_zc_data if block ~ ~ ~ minecraft:water_cauldron
execute unless score $has_liquid gm4_zc_data matches 1 store success score $has_liquid gm4_zc_data store success score $has_powder_snow gm4_zc_data if block ~ ~ ~ minecraft:powder_snow_cauldron
execute unless score $has_liquid gm4_zc_data matches 1 store success score $has_liquid gm4_zc_data store success score $has_lava gm4_zc_data if block ~ ~ ~ minecraft:lava_cauldron
