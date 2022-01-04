# @s = player with a pneuma who was damaged by magic of more than 6 health
# run from pneumas/magic_damage/check

effect give @s[tag=gm4_pneuma_neutralizing] instant_health 1 1 true
effect give @s[tag=gm4_pneuma_lifeless] instant_health 1 2 true
effect give @s[tag=gm4_pneuma_lifeless] regeneration 1 2 true
