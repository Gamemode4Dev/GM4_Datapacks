# flash a beacon at player
# @s = player wearing beacon armor
# at @s
# run from armor/modifier/type/beacon/check

particle flash ^ ^ ^-0.3 0 0 0 0 0 force @a
effect give @s glowing 1 0 true
