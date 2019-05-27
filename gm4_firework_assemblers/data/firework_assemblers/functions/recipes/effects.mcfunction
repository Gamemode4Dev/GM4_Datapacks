#firework assembler recipe effects
#@s - firework assembler after recipe
#called by all firework assembler recipes

#summon firework
summon minecraft:firework_rocket ~ ~1 ~ {LifeTime:7}

#audiovisuals
particle minecraft:flash
playsound minecraft:entity.firework_rocket.blast player @a[distance=..20] ~ ~ ~ 100 1 1

#move item
data modify block ~ ~ ~ Items[{Slot:0b}].Slot set value 8b
