# @s = player who placed a relocator player head on a unsupported block
# located at the block the head was placed on
# run from pick_up/find_machine

execute at @p[tag=gm4_rl_placed_relocator,distance=..10] run loot spawn ~ ~.3 ~ loot gm4_relocators:relocator
data merge entity @e[type=item,distance=..10,nbt={Age:0s},limit=1] {PickupDelay:0}

particle minecraft:smoke ~ ~ ~ .3 .3 .3 0 10
playsound minecraft:block.fire.extinguish block @a[distance=..8] ~ ~ ~ 0.6 1.5
