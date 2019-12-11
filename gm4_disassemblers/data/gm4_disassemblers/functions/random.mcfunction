# Called from calculate_percent
# @s = item to disassemble
execute store result score random gm4_disassembler run data get entity @s UUIDMost 0.00000000023283064365386962890625
scoreboard players operation random gm4_disassembler /= #100 gm4_disassembler
scoreboard players operation random gm4_disassembler %= max_random_items gm4_disassembler
