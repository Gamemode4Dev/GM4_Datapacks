# @s = bottled vex item
# run from cauldron/extra_items/release_from_bottle/check_timer
# at @s

# set initial score
scoreboard players set @s gm4_zc_bottled_vex_escape_timer 3

# load data from item
data modify storage gm4_zauber_cauldrons:temp/cauldron/extra_items bottled_vex set from entity @s Item.tag.gm4_zauber_cauldrons
execute store result score @s gm4_zc_moon_phase run data get storage gm4_zauber_cauldrons:temp/cauldron/extra_items bottled_vex.preferred_moon_phase
execute store result score @s gm4_zc_fullness run data get storage gm4_zauber_cauldrons:temp/cauldron/extra_items bottled_vex.vex_count

# reset storage
data remove storage gm4_zauber_cauldrons:temp/cauldron/extra_items bottled_vex
