# @s = zauber cauldron
# at @s
# run from cauldron/structure/analyze/liquid

# analyze type of heatsource used
execute store success score $has_heatsource gm4_zc_data if block ~ ~-1 ~ #minecraft:campfires[lit=true]
execute unless score $has_heatsource gm4_zc_data matches 1 store success score $has_heatsource gm4_zc_data if block ~ ~-1 ~ #minecraft:fire
execute if score $has_heatsource gm4_zc_data matches 1 store success score $has_soul_fire_heatsource gm4_zc_data if block ~ ~-1 ~ #gm4_zauber_cauldrons:soul_fire_heatsource

# enable cauldron for crafting
execute if score $has_heatsource gm4_zc_data matches 1 run function gm4_zauber_cauldrons:cauldron/structure/valid
# TODO update call reference in valid.mcfunction
# TODO ensure correct liquid is in cauldron for recipes
# TODO update creation to accept more heatsources
