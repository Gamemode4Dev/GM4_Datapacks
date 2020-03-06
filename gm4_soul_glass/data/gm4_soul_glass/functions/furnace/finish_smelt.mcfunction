#@s = blast furnace AEC that finished smelting soul sand to soul glass
#run from smelt

tag @s remove gm4_sg_smelting
tag @s add gm4_sg_smelted
execute if block ~ ~-1 ~ hopper{TransferCooldown:1} run data modify block ~ ~-1 ~ TransferCooldown set value 2
execute if block ~ ~-1 ~ hopper{TransferCooldown:0} run data modify block ~ ~-1 ~ TransferCooldown set value 2
execute positioned ~ ~-1 ~ as @e[type=hopper_minecart,distance=..1] run data merge entity @s {Enabled:0b,Tags:["gm4_sg_disabled"]}
schedule function gm4_soul_glass:furnace/modify_output 1t
