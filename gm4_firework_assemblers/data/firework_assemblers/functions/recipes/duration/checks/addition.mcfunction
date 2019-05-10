#@s = firework assemblers with duration recipe

#store item data
execute store result score @s gm4_fa_d_math_fd run data get block ~ ~ ~ Items[{Slot:0b}].tag.Fireworks.Flight
execute store result score @s gm4_fa_d_math_fc run data get block ~ ~ ~ Items[{Slot:0b}].Count
execute store result score @s gm4_fa_d_math_gc run data get block ~ ~ ~ Items[{Slot:1b}].Count
#maths
scoreboard players operation @s gm4_fa_d_math_r = @s gm4_fa_d_math_gc
scoreboard players operation @s gm4_fa_d_math_gc /= @s gm4_fa_d_math_fc
scoreboard players operation @s gm4_fa_d_math_r %= @s gm4_fa_d_math_fc

scoreboard players operation @s gm4_fa_d_math_fd += @s gm4_fa_d_math_gc

#recipe checks
execute if score @s gm4_fa_d_math_fd matches 1..5 if score @s gm4_fa_d_math_gc matches 1.. run function firework_assemblers:recipes/duration/add
