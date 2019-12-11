#@s = liquid minecart going over active activator rail
#run from command_block_minecart (liquid minecart)

scoreboard players set @s gm4_lt_value 0
data merge entity @s {Tags:["gm4_liquid_minecart","gm4_liquid_minecart_empty"]}
function liquid_minecarts:liquid_value_update
playsound minecraft:block.brewing_stand.brew block @a ~ ~ ~ 1.0 0.0
