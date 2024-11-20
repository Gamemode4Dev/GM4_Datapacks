# determines the chorus and popped chorus amounts required for the wormhole recipe depending on the world seed
# none
# at world spawn
# Run from init if neither $required_total nor required_total are present in gm4_zc_flowers, the latter being a check for old worlds

# initialize randomizer
random reset gm4_zauber_cauldrons:chorus/chorus_amounts 0 true true

# roll random chorus and popped chorus fruit amounts
execute store result score $required_chorus_fruit gm4_zc_chorus run random value 1..64 gm4_zauber_cauldrons:chorus/chorus_amounts
execute store result score $required_popped_chorus_fruit gm4_zc_chorus run random value 1..64 gm4_zauber_cauldrons:chorus/chorus_amounts

# store total
scoreboard players operation $required_total gm4_zc_chorus = $required_chorus_fruit gm4_zc_chorus
scoreboard players operation $required_total gm4_zc_chorus += $required_popped_chorus_fruit gm4_zc_chorus
