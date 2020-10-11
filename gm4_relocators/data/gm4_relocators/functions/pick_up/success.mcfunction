# @s = selected machine block
# located in the center of the block
# run from pick_up/find_machine

advancement grant @a[tag=gm4_rl_placed_relocator,distance=..7] only gm4:relocators

setblock ~ ~ ~ air
playsound minecraft:block.beacon.power_select block @a[distance=..8] ~ ~ ~ 1 1.8
particle minecraft:explosion ~ ~ ~ 0 0 0 0 0

execute at @s run function #gm4_relocators:pick_up
kill @s
