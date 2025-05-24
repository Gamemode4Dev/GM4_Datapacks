# checks the player's current state to decide whether or not to trigger a block conversion
# @s = any survival player
# at unspecified
# run from tick

# terminate if player is not able to create a desire line
execute unless predicate gm4_desire_lines:is_affected run return fail

# determine trigger probability
scoreboard players operation $probability gm4_desire_lines = #base_probability gm4_desire_lines
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_sneaking":true}}} run scoreboard players operation $probability gm4_desire_lines += #sneak_penality gm4_desire_lines
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"flags":{"is_sprinting":true}}} run scoreboard players operation $probability gm4_desire_lines += #sprint_penalty gm4_desire_lines
execute if predicate {"condition":"minecraft:entity_properties","entity":"this","predicate":{"movement":{"vertical_speed":{"min":2}}}} run scoreboard players operation $probability gm4_desire_lines += #impact_penalty gm4_desire_lines
function #gm4_desire_lines:expansion

# | NOTE: if you are writing an expansion, do NOT 'set' $probability, as the order in which expansions are called is arbitrary.
# | Instead, modify $probability by addition or subtraction. Do NOT subtract max_int, as that may cause over or underflows.

# trigger block conversion
execute if predicate {"condition":"minecraft:random_chance","chance":{"type":"minecraft:score","target":{"type":"minecraft:fixed","name":"$probability"},"score":"gm4_desire_lines","scale":0.01}} at @s run function gm4_desire_lines:path
