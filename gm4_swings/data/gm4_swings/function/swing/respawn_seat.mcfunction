# Respawns a new swing seat when an old one is not found
# @s = Item display, swing main body
# at @s
# run from gm4_swings:swing/tick
# with $length = Length of the swing

scoreboard players operation $global gm4_swings.id = @s gm4_swings.id
$execute positioned ^ ^-$(length) ^ positioned ^ ^-0.5 ^ run function gm4_swings:seat/create
