# plays sound & resets signal score
# @s = temp entity inside pot
# at center of pot
# with {place_sound}
# run from decorated/prepare_data and flower/prepare_data

scoreboard players set $play_sound gm4_blossoming_pots.misc 0
$playsound $(place_sound) block @a[distance=..16] ~ ~ ~
