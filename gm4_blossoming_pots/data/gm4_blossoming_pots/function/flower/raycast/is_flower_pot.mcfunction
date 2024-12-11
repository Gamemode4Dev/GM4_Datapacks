# checks if execution context is inside the flower pots hit box
# @s = player who interacted with a flower pot
# at @s anchored eyes, then marched forward 0.005 over and over. Complicated.
# run from flower/raycast/loop

# early return if not flower pot
execute unless block ~ ~ ~ minecraft:flower_pot run return fail

# check if location is in collision box, kills the temp marker if not
execute summon minecraft:marker run return run function gm4_blossoming_pots:flower/raycast/in_pot
