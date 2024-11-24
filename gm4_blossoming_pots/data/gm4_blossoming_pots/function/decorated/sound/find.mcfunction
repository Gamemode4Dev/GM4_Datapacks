# finds the right sound to play and redirects to the function to play it
# @s = temp marker inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with block ~ ~ ~ item
# run from decorated/as_marker


# could probably move the as @a to sound/play so its not doing the macro for everyone...
$execute as @a[distance=..16] run function gm4_blossoming_pots:decorated/sound/play with storage gm4_blossoming_pots:decorated_pots $(id)