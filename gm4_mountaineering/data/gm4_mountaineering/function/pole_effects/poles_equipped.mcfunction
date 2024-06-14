# Give pole-related effects - jump boost on a cooldown and reduced fall damage
# @s = player holding poles
# at @s
# run from player_main

# Records the player's velocities in scoreboards if it wasn't already done (as would be the case if wearing skis)
execute unless entity @s[predicate=gm4_mountaineering:wearing_skis] run function gm4_mountaineering:get_velocity

# Add jump boost effect (1 with skis, 2 without skis, 3 if having an upwards velocity)
effect give @s[scores={gm4_mountaineering_poles_jump_boost=..0,gm4_mountaineering_vy=2..}] jump_boost 1 2 true
effect give @s[predicate=!gm4_mountaineering:wearing_skis,scores={gm4_mountaineering_poles_jump_boost=..0,gm4_mountaineering_vy=..0}] jump_boost 1 1 true
effect give @s[predicate=gm4_mountaineering:wearing_skis,scores={gm4_mountaineering_poles_jump_boost=..0,gm4_mountaineering_vy=..0}] jump_boost 1 0 true

# Reduce jump cooldown
scoreboard players remove @s[scores={gm4_mountaineering_poles_jump_boost=1..}] gm4_mountaineering_poles_jump_boost 1

# If jump, reset cooldown and jump counter
scoreboard players set @s[scores={gm4_mountaineering_jump_counter=1..}] gm4_mountaineering_poles_jump_boost 3
