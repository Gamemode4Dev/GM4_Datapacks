#@s = firework assemblers with duration recipe

#audiovisuals
particle minecraft:flash
playsound minecraft:entity.firework_rocket.blast player @a[distance=..20] ~ ~ ~ 100 1 1

#remove gunpowder/add remainder
execute store result block ~ ~ ~ Items[{Slot:1b}].Count byte 1 run scoreboard players get @s gm4_fa_d_math_r
#store count into fireworks
execute store result block ~ ~ ~ Items[{Slot:0b}].tag.Fireworks.Flight byte 1 run scoreboard players get @s gm4_fa_d_math_fd
#move fireworks
data modify block ~ ~ ~ Items[{Slot:0b}].Slot set value 8b
