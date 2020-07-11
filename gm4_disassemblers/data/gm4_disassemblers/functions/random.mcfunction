# Called from calculate_percent
# @s = item to disassemble
execute store result score random gm4_disassembler run data get entity @s UUID[0]
scoreboard players operation random gm4_disassembler /= #100 gm4_disassembler
scoreboard players operation random gm4_disassembler %= max_random_items gm4_disassembler
