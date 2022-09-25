# Give skiing effects when skis are worn and the player is on snow
# @s = player with skiing tag and wearing skis
# at @s
# run from main

# Give speed
effect give @s speed 2 0 true

execute as @s[scores={gm4_mountaineering_vy=..-2}] run effect give @s speed 2 1 true
