# runs at player near lightning strike
# @s = player
# runs from advancement, gm4_chairs:lightning

advancement revoke @s only gm4_chairs:lightning
schedule function gm4_chairs:lightning/delay 50t
