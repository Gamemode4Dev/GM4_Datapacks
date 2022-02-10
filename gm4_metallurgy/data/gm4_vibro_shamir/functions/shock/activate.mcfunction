# @s = none
# located at world spawn
# run from shockwave

execute as @a[scores={gm4_vibro_shock=1..}] at @s run function gm4_vibro_shamir:shock/user
scoreboard players reset @a gm4_vibro_shock
