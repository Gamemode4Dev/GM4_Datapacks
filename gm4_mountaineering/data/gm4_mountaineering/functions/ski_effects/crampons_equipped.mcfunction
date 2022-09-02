# Give jump boost effects when wearing crampons
# @s = player wearing crampons
# at @s
# run from main

# Always provide jump boost 1
effect give @s jump_boost 2 0 true

# Provide jump boost 2 when also holding poles
effect give @s[predicate=gm4_mountaineering:holding_poles] jump_boost 2 1 true