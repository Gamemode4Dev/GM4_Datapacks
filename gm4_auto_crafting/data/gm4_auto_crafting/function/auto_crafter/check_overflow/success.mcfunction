# finalizes a successful operation
# @s = auto crafter that didn't overflow the ouput
# located at @s positioned ^ ^ ^-1
# run from gm4_auto_crafting:auto_crafter/process_output

# mark as completed craft
tag @s remove gm4_ac_full
scoreboard players reset @s gm4_ac_buffer
data remove entity @s data.gm4_auto_crafting.buffer

# visuals
execute if score $crafted gm4_crafting matches 1 run playsound minecraft:block.anvil.land block @a[distance=..8] ~ ~ ~ 0.08 1.4
execute if score $crafted gm4_crafting matches 1 run particle minecraft:electric_spark ~ ~ ~ 0.15 0.15 0.15 .1 20

execute if score $crafted gm4_crafting matches 0 run playsound minecraft:block.chain.break block @a[distance=..8] ~ ~ ~ 0.7 0.87
execute if score $crafted gm4_crafting matches 0 run particle minecraft:ash ~ ~ ~ 0.1 0.1 0.1 0.6 20
