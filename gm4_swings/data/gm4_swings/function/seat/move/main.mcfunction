# Wrapper for moving the swing seat, a tp macro is expensive and this vastly improves that
# @s = Item display, swing seat
# at @s rotated as swing main body
# run from gm4_swings:swing/tick
# with $length = Length of the swing being placed

$execute positioned ^ ^-$(length).5 ^ positioned ^ ^-0.5 ^ run function gm4_swings:seat/move/tp
