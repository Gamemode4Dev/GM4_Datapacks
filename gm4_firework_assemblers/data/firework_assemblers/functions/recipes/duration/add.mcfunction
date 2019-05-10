#@s = firework assemblers with duration recipe

#remove gunpowder/add remainder
execute store result block ~ ~ ~ Items[{Slot:1b}].Count byte 1 run scoreboard players get @s gm4_fa_d_math_r
#store count into fireworks
execute store result block ~ ~ ~ Items[{Slot:0b}].tag.Fireworks.Flight byte 1 run scoreboard players get @s gm4_fa_d_math_fd

#effects
function firework_assemblers:recipes/effects
