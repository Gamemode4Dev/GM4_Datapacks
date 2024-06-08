# @s = bottled vex item
# run from cauldron/extra_items/release_from_bottle/check_timer
# at @s

# decrease timer
scoreboard players remove @s gm4_zc_bottled_vex_escape_timer 1

# play sound and particles
playsound minecraft:block.glass.break block @a[distance=..8] ~ ~ ~ 0.1 1.9
particle minecraft:block{block_state:"minecraft:glass"} ~ ~ ~ 0.1 0.1 0.1 0 1

# players wearing zauber armor can tell if its the right moon phase
execute if score @s gm4_zc_moon_phase = $current gm4_zc_moon_phase if function gm4_zauber_cauldrons:cauldron/liquid/magicol/check_moon_phase run particle minecraft:electric_spark ~ ~.2 ~ 0.15 0.15 0.15 0.01 3 normal @a[distance=..8,advancements={gm4_zauber_cauldrons:equipment/has_full_armor=true}]
