# Give skiing effects when skis are worn and the player is on snow [DEPRECATED]
# @s = player with skiing tag and wearing skis
# at @s
# run from main













# Give speed
effect give @s speed 2 0 true

# Add tags for when the player is falling
#execute as @s[scores={gm4_mountaineering_vy=..-2}] run tag @s add gm4_mountaineering_falling
#execute as @s[scores={gm4_mountaineering_vy=..-6}] run tag @s add gm4_mountaineering_falling_fast

# Run function to increase speed further (will happen depending on fall speed)

# Remove speed if no longer falling
