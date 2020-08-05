# @s = gm4_disassembler to be picked up by relocator
# run from relocate/pick_up_check

scoreboard players set valid_machine gm4_rl_data 1

setblock ~ ~ ~ air
playsound minecraft:block.beacon.power_select block @a[distance=..8] ~ ~ ~ 1 1.8
particle minecraft:explosion ~ ~ ~ 0 0 0 0 0

loot spawn ~ ~0.7 ~ loot gm4_disassemblers:relocator

kill @s
