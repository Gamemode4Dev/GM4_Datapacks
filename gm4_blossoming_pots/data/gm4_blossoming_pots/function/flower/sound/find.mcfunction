# finds the right sound to play and redirects to the function to play it
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with entity @s data
# run from flower/as_marker


# could probably move the as @a to sound/play so its not doing the macro for everyone...
$execute as @a[distance=..16] run function gm4_blossoming_pots:flower/sound/play with storage gm4_blossoming_pots:flower_pots $(id)