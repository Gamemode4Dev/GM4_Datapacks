# Literally just plays sound & resets signal
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {place_sound}
# run from flower/prepare_data

scoreboard players set $play_sound gm4_blossoming_pots.misc 0
$playsound $(place_sound) block @a[distance=..16] ~ ~-0.3125 ~
