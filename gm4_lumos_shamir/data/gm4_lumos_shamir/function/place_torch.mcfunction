#run from active
#@s = player with torches

setblock ~ ~ ~ minecraft:torch
clear @s[gamemode=!creative] torch 1

playsound minecraft:block.wood.place block @a ~ ~ ~ 1 1
execute align xyz positioned ~0.5 ~0.5 ~0.5 run particle minecraft:firework ~ ~0.4 ~ 0.08 0 0.08 0.01 3
