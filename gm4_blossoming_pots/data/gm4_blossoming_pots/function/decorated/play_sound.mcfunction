# Literally just plays sound & resets signal score
# @s = temp marker inside decorated pot
# with {place_sound}
# at @s align xyz positioned ~.5 ~.5 ~.5
# run from decorated/prepare_data

scoreboard players set $play_sound gm4_blossoming_pots.misc 0
$playsound $(place_sound) block @a[distance=..16] ~ ~ ~
