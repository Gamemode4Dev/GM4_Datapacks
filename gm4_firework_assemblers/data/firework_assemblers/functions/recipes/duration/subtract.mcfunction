#firework assembler recipe
#@s - firework assembler with valid recipe
#called by firework_assemblers:recipe_check

#get flight duration
execute store result score @s gm4_fa_d_math_fd run data get block ~ ~ ~ Items[{Slot:0b}].tag.Fireworks.Flight

execute store result score @s gm4_fa_d_math_gc run data get block ~ ~ ~ Items[{Slot:0b}].tag.Fireworks.Flight
execute store result score @s gm4_fa_d_math_fc run data get block ~ ~ ~ Items[{Slot:0b}].Count
#maths
scoreboard players remove @s gm4_fa_d_math_fd 1
#store count into fireworks
execute store result block ~ ~ ~ Items[{Slot:0b}].tag.Fireworks.Flight byte 1 run scoreboard players get @s gm4_fa_d_math_fd
#return gunpowder
data modify block ~ ~ ~ Items append value {Slot:7b,id:"minecraft:gunpowder",Count:1b}
execute store result block ~ ~ ~ Items[{Slot:7b}].Count byte 1 run scoreboard players get @s gm4_fa_d_math_fc

#effects
function firework_assemblers:recipes/effects
