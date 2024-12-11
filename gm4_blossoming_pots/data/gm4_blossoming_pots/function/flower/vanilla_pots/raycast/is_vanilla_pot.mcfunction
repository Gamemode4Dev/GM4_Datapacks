# checks if execution context is inside the vanilla flower pots hit box
# @s = player who interacted with a vanilla flower pot
# at @s anchored eyes, then marched forward 0.005 over and over. Complicated.
# run from flower/vanilla_pots/raycast/loop

# early return if not dec pot
execute unless block ~ ~ ~ #gm4_blossoming_pots:potted_plants run return fail

# check if location is in collision box, kills the temp marker if not
execute summon minecraft:marker run return run function gm4_blossoming_pots:flower/vanilla_pots/raycast/in_pot
