#run from check_throw
#@s = thrown entity

execute store result entity @s Motion[0] double 0.001 run data get entity @s Motion[0] 2000
execute store result entity @s Motion[1] double 0.001 run data get entity @s Motion[1] 2000
execute store result entity @s Motion[2] double 0.001 run data get entity @s Motion[2] 2000

playsound minecraft:entity.witch.throw player @a ~ ~ ~ .4 1
