# invisibility and speed II when sneaking and undamaged
# @s = player wearing armor
# run from armor/check_modifier

effect give @s invisibility 1 0 true
execute if predicate gm4_combat_expanded:technical/crouching run effect give @s speed 1 1 true
