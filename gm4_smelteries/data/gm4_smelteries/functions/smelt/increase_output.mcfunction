# increases the smeltery output by 1
# @s = smeltery marker that finished smelting
# located at a smeltery that finished smelting
# run from smelt/modify_output

execute store result score $output gm4_smelt_data run data get block ~ ~ ~ Items[{Slot:2b}].Count
execute store result block ~ ~ ~ Items[{Slot:2b}].Count byte 1 if score $output gm4_smelt_data matches ..63 run scoreboard players add $output gm4_smelt_data 1

particle large_smoke ~ ~ ~ 0.1 0 0.1 0.05 5 normal @a
playsound block.redstone_torch.burnout block @a[distance=..8] ~ ~ ~ 0.8 2
playsound block.lava.ambient block @a[distance=..8] ~ ~ ~ 0.6 2

# clean up
tag @s remove gm4_smeltery_smelted
execute as @e[type=hopper_minecart,tag=gm4_smelteries_disabled,distance=..3] run data merge entity @s {Enabled:1b}
tag @e[type=hopper_minecart,distance=..3] remove gm4_smelteries_disabled
