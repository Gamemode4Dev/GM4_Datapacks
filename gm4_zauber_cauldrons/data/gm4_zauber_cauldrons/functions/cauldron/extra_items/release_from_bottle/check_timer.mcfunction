# @s = bottled vex item
# run from cauldron/extra_items/process_bottled_vex_items
# at @s

# initialize newly thrown bottles
execute unless score @s gm4_zc_bottled_vex_escape_timer matches -2147483648..2147483647 run function gm4_zauber_cauldrons:cauldron/extra_items/release_from_bottle/initialize_bottle

# decrease timer
execute if score @s gm4_zc_bottled_vex_escape_timer matches 0.. run function gm4_zauber_cauldrons:cauldron/extra_items/release_from_bottle/crack_bottle

# break free (if the moon phase is right, the bottle survives an additional tick)
execute if score @s gm4_zc_bottled_vex_escape_timer matches 1 unless function gm4_zauber_cauldrons:cauldron/liquid/magicol/check_moon_phase run function gm4_zauber_cauldrons:cauldron/extra_items/release_from_bottle/release
execute if score @s gm4_zc_bottled_vex_escape_timer matches ..0 run function gm4_zauber_cauldrons:cauldron/extra_items/release_from_bottle/release
