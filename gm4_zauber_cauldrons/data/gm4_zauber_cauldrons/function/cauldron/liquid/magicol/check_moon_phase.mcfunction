# Checks the moon phase, time, and weather for the correct conditions for magicol bottling. Used to display sparkle particles and to bottle magicol.
# @s = varies
# at varies
# run in if function conditions from gm4_zauber_cauldrons:cauldron/extra_items/release_from_bottle/check_timer, gm4_zauber_cauldrons:recipes/magicol/bottled/<...>/<...>/<...>, and gm4_zauber_cauldrons:cauldron/liquid/magicol/particles

# require clear night and correct moon phase
execute unless predicate gm4_zauber_cauldrons:cauldron/clear_night run return fail
execute unless score $preferred gm4_zc_moon_phase = $current gm4_zc_moon_phase run return fail
return 1
