# Literally just plays sound
# @s = temp marker inside flower pot
# with storage gm4_blossoming_pots:flower_pots <id of item in >
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {place_sound}
# run from flower/prepare_data


$playsound $(place_sound) block @a[distance=..16] ~ ~-0.3125 ~
