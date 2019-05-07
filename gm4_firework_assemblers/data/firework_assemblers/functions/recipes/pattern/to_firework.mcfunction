#@s = firework assemblers with pattern recipe

#modify item data
data modify block ~ ~ ~ Items[{Slot:0b}].tag.Fireworks.Explosions set from block ~ ~ ~ Items[{Slot:1b}].tag.Fireworks.Explosions
#audiovisuals
particle minecraft:flash
playsound minecraft:entity.firework_rocket.blast player @a[distance=..20] ~ ~ ~ 100 1 1

#move paper
data modify block ~ ~ ~ Items[{Slot:0b}].Slot set value 8b
