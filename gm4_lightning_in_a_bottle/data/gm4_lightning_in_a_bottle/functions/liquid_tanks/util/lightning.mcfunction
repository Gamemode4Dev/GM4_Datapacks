# @s = living-base entity below ink tank
# run from gm4_lightning_in_a_bottle:liquid_tanks/util_below

execute at @s run summon lightning_bolt ~ ~ ~
scoreboard players remove @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank,distance=..8] gm4_lt_value 1
playsound entity.player.swim block @a[distance=..8] ~ ~ ~ .5 1.5

advancement grant @s only gm4:lightning_in_a_bottle_drink
