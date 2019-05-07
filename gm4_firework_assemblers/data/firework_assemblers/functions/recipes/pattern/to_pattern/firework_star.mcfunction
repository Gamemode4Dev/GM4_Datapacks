#@s = firework assemblers with pattern recipe

#store item data
data modify block ~ ~ ~ Items[{Slot:0b}].tag.Fireworks.Explosions set value [{}]
data modify block ~ ~ ~ Items[{Slot:0b}].tag.Fireworks.Explosions[0] set from block ~ ~ ~ Items[{Slot:1b}].tag.Explosion
#set name
data modify block ~ ~ ~ Items[{Slot:0b}].tag.display.Name set value '{"translate":"%1$s","with":["Firework Pattern",{"translate":"item.gm4.firework_pattern"}],"italic":false,"color":"light_purple"}'
data modify block ~ ~ ~ Items[{Slot:0b}].tag.gm4_firework_assemblers.firework_pattern set value 1b
#audiovisuals
particle minecraft:flash
playsound minecraft:entity.firework_rocket.blast player @a[distance=..20] ~ ~ ~ 100 1 1

#lore
#NEED LORE FROM DATA ABOVE

#move paper
data modify block ~ ~ ~ Items[{Slot:0b}].Slot set value 8b
