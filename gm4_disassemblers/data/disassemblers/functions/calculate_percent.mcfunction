# Calculates Durability percentage and Items to return
# Called from items folder
# @s = item to disassemble

#Calculate durability percentage:
scoreboard players operation max_random_items gm4_disassembler = max_items gm4_disassembler
scoreboard players operation diff_damage gm4_disassembler = max_damage gm4_disassembler
scoreboard players operation diff_damage gm4_disassembler -= damage gm4_disassembler
scoreboard players operation max_damage gm4_disassembler *= #100 gm4_disassembler
scoreboard players operation max_damage gm4_disassembler /= diff_damage gm4_disassembler

#Calculate Items to return
scoreboard players operation max_items gm4_disassembler *= #100 gm4_disassembler
scoreboard players operation max_items gm4_disassembler /= max_damage gm4_disassembler
scoreboard players operation result_items gm4_disassembler = max_items gm4_disassembler
execute if score result_items gm4_disassembler < max_random_items gm4_disassembler run tag @s add not_full
execute if score result_items gm4_disassembler < max_random_items gm4_disassembler run scoreboard players add result_items gm4_disassembler 1

#Subtract random items
scoreboard players operation max_random_items gm4_disassembler /= #2 gm4_disassembler
execute if score max_random_items gm4_disassembler matches ..0 run scoreboard players set max_random_items gm4_disassembler 1
execute if entity @s[tag=not_full] run scoreboard players add max_random_items gm4_disassembler 1
function disassemblers:random
scoreboard players operation result_items gm4_disassembler -= random gm4_disassembler
