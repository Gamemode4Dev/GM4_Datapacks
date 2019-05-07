#@s = firework assemblers with pattern recipe

#store item data
data modify block ~ ~ ~ Items[{Slot:0b}].tag.Fireworks.Explosions set value [{}]
data modify block ~ ~ ~ Items[{Slot:0b}].tag.Fireworks.Explosions[0] set from block ~ ~ ~ Items[{Slot:1b}].tag.Explosion
#audiovisuals
particle minecraft:flash
playsound minecraft:entity.firework_rocket.blast player @a[distance=..20] ~ ~ ~ 100 1 1

#lore
#NEED LORE FROM DATA ABOVE

#move paper
data modify block ~ ~ ~ Items[{Slot:0b}].Slot set value 8b
