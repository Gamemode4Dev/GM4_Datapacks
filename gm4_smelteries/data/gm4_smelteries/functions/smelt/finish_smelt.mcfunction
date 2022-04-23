# complete the smelting process
# @s = smeltery marker that finished smelting
# located at @s
# run from smelt/check_finish_smelt

tag @s remove gm4_smeltery_smelting
tag @s add gm4_smeltery_smelted
execute if block ~ ~-1 ~ hopper{TransferCooldown:1} run data modify block ~ ~-1 ~ TransferCooldown set value 2
execute if block ~ ~-1 ~ hopper{TransferCooldown:0} run data modify block ~ ~-1 ~ TransferCooldown set value 2
execute positioned ~ ~-1 ~ as @e[type=hopper_minecart,distance=..1] run tag @s add gm4_smelteries_disabled
execute as @e[type=hopper_minecart,tag=gm4_smelteries_disabled,distance=..3] run data merge entity @s {Enabled:0b}
schedule function gm4_smelteries:smelt/modify_output 1t

# lava cauldron
execute if block ^ ^ ^-1 cauldron if predicate gm4_smelteries:lava_cauldron_chance run setblock ^ ^ ^-1 lava_cauldron
