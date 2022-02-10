# @s = player with a pneuma who was damaged by magic of 6 or less health
# run from pneumas/magic_damage/check

effect give @s[tag=gm4_pneuma_neutralizing] instant_health 1 0 true
effect give @s[tag=gm4_pneuma_lifeless] instant_health 1 1 true
effect give @s[tag=gm4_pneuma_lifeless] regeneration 1 1 true
