# Adds a value from the lookup table to Y motion
# with {lookup_key}
# run from get_motion_to_player

$scoreboard players operation $motionY gm4_reeling_rods.math += $$(lookup_key) gm4_reeling_rods.lookup
