# @s = bottled vex item
# run from cauldron/extra_items/release_from_bottle/crack_bottle
# at @s

# load data from item
data modify storage gm4_zauber_cauldrons:temp/cauldron/extra_items bottled_vex set from entity @s Item.tag.gm4_zauber_cauldrons
execute store result score @s gm4_zc_moon_phase run data get storage gm4_zauber_cauldrons:temp/cauldron/extra_items bottled_vex.preferred_moon_phase
execute store result score @s gm4_zc_fullness run data get storage gm4_zauber_cauldrons:temp/cauldron/extra_items bottled_vex.vex_count

# unless it is the vex's preferred moon phase, start release one tick early
execute unless score @s gm4_zc_moon_phase = $current gm4_zc_moon_phase run function gm4_zauber_cauldrons:cauldron/extra_items/release_from_bottle/release
