# @s = all players
# at @s
# run from advancement gm4_mysterious_midnights:dimension/overworld/event/full_moon_night

# revoke advancement
advancement revoke @s only gm4_mysterious_midnights:dimension/overworld/event/full_moon_night

# restore single global context
execute unless score night_active gm4_mm_data matches 1 run schedule function gm4_mysterious_midnights:start_midnight 1t replace
