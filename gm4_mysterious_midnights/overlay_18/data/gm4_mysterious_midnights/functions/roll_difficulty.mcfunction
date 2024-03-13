# Rolls a new value for the difficulty based on the world seed and the day number.
# @s = none
# at 29999998 1 7134 (forceloaded chunk)
# run from gm4_mysterious_midnights:calculate_difficulty

# reset rng to use day count as seed
$random reset gm_mysterious_midnights:midnight_difficulty $(day) true true

# store random value
execute store result score difficulty gm4_mm_data run random value 0..15 gm_mysterious_midnights:midnight_difficulty
