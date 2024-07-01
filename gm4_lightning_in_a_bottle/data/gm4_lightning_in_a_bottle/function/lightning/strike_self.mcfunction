# player drinking Bottle of Lightning
# @s = player that drank Bottle of Lightning
# at @s
# from advancement, gm4:lightning_drink

advancement revoke @s only gm4_lightning_in_a_bottle:drink_lightning

summon lightning_bolt ~ ~ ~

effect give @s speed 2 3

advancement grant @s only gm4:lightning_in_a_bottle_drink
