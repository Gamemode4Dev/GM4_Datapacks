#@s = liquid minecart going over active activator rail
#run from command_block_minecart (liquid minecart)

scoreboard players set @s gm4_lt_value 0
tag @s add gm4_liquid_minecart_empty
execute as @e[type=armor_stand,limit=1,sort=nearest,tag=gm4_liquid_minecart_stand] run function gm4_liquid_minecarts:set_empty_data
function gm4_liquid_minecarts:liquid_value_update
playsound minecraft:block.brewing_stand.brew block @a ~ ~ ~ 1.0 0.0
