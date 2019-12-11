# @s = entity below honey tank
# at executing honey tank above

effect give @s regeneration 400 0
scoreboard players remove @e[type=armor_stand,tag=gm4_liquid_tank,tag=gm4_processing_tank] gm4_lt_buffer 1
playsound entity.player.swim block @a[distance=..8] ~ ~ ~ .5 1.5
