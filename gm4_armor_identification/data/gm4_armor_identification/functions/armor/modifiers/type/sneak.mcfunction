# run from armor/check_modifier
# @s = player wearing sneaking armor while undamaged

# invisibility and speed II when sneaking
effect give @s invisibility 1 0 true
execute if predicate gm4_armor_identification:technical/crouching run effect give @s speed 1 1 true
