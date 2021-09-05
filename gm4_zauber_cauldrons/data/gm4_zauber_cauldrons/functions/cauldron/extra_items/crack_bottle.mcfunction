# @s = none
# at world spawn
# scheduled from init

# release vexes from bottled vexes
execute as @e[type=item,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}}] at @s run function gm4_zauber_cauldrons:cauldron/extra_items/release_from_bottle

# reschedule
schedule function gm4_zauber_cauldrons:cauldron/extra_items/crack_bottle 48t
