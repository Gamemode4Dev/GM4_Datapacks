# @s = non-spectator players
# at world spawn
# run from slow_clock

# apply crystal effects
execute as @a[gamemode=!spectator] if predicate gm4_zauber_cauldrons:player/equipment/crystal/luck_and_in_offhand run function gm4_zauber_cauldrons:recipes/crystals/apply_effects

# grant full zauber armor advancement
execute as @a[gamemode=!spectator] if predicate gm4_zauber_cauldrons:player/equipment/armor/full run advancement grant @s only gm4:zauber_cauldrons_full_armor
