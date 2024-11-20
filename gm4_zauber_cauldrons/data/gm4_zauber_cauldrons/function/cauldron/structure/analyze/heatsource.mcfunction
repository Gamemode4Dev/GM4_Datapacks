# @s = zauber cauldron
# at @s align xyz
# run from cauldron/structure/validate/heatsource
# fake players must be reset after the result of this function was evaluated

# analyze type of heatsource used
execute store success score $has_heatsource gm4_zc_data if block ~ ~-1 ~ #minecraft:campfires[lit=true]
execute unless score $has_heatsource gm4_zc_data matches 1 store success score $has_heatsource gm4_zc_data if block ~ ~-1 ~ #minecraft:fire
execute if score $has_heatsource gm4_zc_data matches 1 store success score $has_soul_fire_heatsource gm4_zc_data if block ~ ~-1 ~ #gm4_zauber_cauldrons:soul_fire_heatsource
