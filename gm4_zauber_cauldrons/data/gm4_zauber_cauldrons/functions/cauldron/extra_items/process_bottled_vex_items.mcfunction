# @s = none
# at world spawn
# scheduled every 48t

# get current moon phase
execute store result score $current gm4_zc_moon_phase run time query day
scoreboard players operation $current gm4_zc_moon_phase %= #8 gm4_zc_moon_phase

# release vexes from bottled vexes
execute as @e[type=item] if items entity @s contents *[custom_data~{gm4_zauber_cauldrons:{item:"bottled_vex"}}] at @s run function gm4_zauber_cauldrons:cauldron/extra_items/release_from_bottle/check_timer

# reschedule
schedule function gm4_zauber_cauldrons:cauldron/extra_items/process_bottled_vex_items 48t
