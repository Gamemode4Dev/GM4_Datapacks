# @s = area_effect_cloud to store command
# located at the the head that was placed
# run from a command block placed by place_down/replace_head

setblock ~ ~ ~ air
setblock ~ ~ ~ command_block[facing=up]

tag @s remove gm4_rl_relocation_data
data modify block ~ ~ ~ Command set from entity @s Tags[0]
data merge block ~ ~ ~ {auto:1}

execute at @p[tag=gm4_rl_placed_relocated_block,distance=..10] run loot spawn ~ ~.3 ~ loot gm4_relocators:relocator
data merge entity @e[type=item,distance=..10,nbt={Age:0s},limit=1] {PickupDelay:0}

playsound minecraft:block.beacon.activate block @a[distance=..8] ~ ~ ~ 1 2

tag @p[tag=gm4_rl_placed_relocated_block,distance=..10] remove gm4_rl_placed_relocated_block
