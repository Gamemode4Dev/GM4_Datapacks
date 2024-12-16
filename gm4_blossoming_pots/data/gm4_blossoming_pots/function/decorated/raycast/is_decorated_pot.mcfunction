# checks if execution context is inside the decorated pots hit box
# @s = player who interacted with a decorated pot
# at @s anchored eyes, then marched forward 0.005 over and over. Complicated.
# run from decorated/raycast/loop

# early return if not dec pot
execute unless block ~ ~ ~ minecraft:decorated_pot run return fail

# check if location is in collision box, kills the temp marker if not
execute summon minecraft:marker run return run function gm4_blossoming_pots:decorated/raycast/in_pot
