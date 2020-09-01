# @s = command block placed by gm4_block_compressors:relocate/replace_head

execute at @p[tag=gm4_rl_placed_relocated_block,distance=..10] run loot spawn ~ ~.3 ~ loot gm4_relocators:relocator
data merge entity @e[type=item,distance=..10,nbt={Age:0s},limit=1] {PickupDelay:0}

playsound minecraft:block.beacon.activate block @a[distance=..8] ~ ~ ~ 1 2

tag @p[tag=gm4_rl_placed_relocated_block,distance=..10] remove gm4_rl_placed_relocated_block
