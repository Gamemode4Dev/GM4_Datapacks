# @s = none
# at world spawn
# run from event_clock as long as a mysterious midnight is active

# reset flag
scoreboard players set night_active gm4_mm_data 0

# notify expansions of night end
function #gm4_mysterious_midnights:end_pulse

# kill all expansions AECs
kill @e[type=area_effect_cloud,tag=gm4_mysterious_midnights_expansion]
