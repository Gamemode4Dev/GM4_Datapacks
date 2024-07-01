# @s = players affected by draining pneuma
# run from pneumas/draining/search

effect give @s mining_fatigue 12 2
execute at @s run particle minecraft:elder_guardian ~ ~ ~ 0 0 0 1 1 force @s
playsound minecraft:entity.elder_guardian.curse player @s
