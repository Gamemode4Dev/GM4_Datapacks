#@s = soul glass AEC
#run from effects/check

execute store result score @s gm4_sg_primary run data get block ~ ~-1 ~ Primary
execute store result score @s gm4_sg_secondary run data get block ~ ~-1 ~ Secondary

data modify block ~ ~-1 ~ Primary set value -1
data modify block ~ ~-1 ~ Secondary set value -1

playsound minecraft:entity.wither.spawn block @a[distance=..10] ~ ~ ~ .5 1.3
particle minecraft:witch ~ ~-1 ~ 0.5 0.5 0.5 0 40 force
advancement grant @a[distance=..4] only gm4:soul_glass
