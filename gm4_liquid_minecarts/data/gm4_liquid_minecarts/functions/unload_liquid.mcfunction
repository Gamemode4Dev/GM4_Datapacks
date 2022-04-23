#@s liquid minecart above a liquid tank that can accept the liquid
#run from compare_unload_liquid

#take all the liquid in the tank (or as much as the minecart can hold) (amount of liquid to take stored in gm4_lm_data)
#get remaining space in tank
scoreboard players operation @s gm4_lm_data = @e[type=marker,limit=1,sort=nearest,tag=gm4_liquid_tank] gm4_lt_max
scoreboard players operation @s gm4_lm_data -= @e[type=marker,limit=1,sort=nearest,tag=gm4_liquid_tank] gm4_lt_value
#lower lm_data if tank has less space than minecart's liquid level
scoreboard players operation @s gm4_lm_data < @s gm4_lt_value

#remove liquid from minecart
scoreboard players operation @s gm4_lt_value -= @s gm4_lm_data
#give liquid to tank
scoreboard players operation @e[type=marker,limit=1,sort=nearest,tag=gm4_liquid_tank] gm4_lt_value += @s gm4_lm_data
#update display
function gm4_liquid_minecarts:liquid_value_update
execute as @e[type=marker,limit=1,sort=nearest,tag=gm4_liquid_tank] run function gm4_liquid_tanks:liquid_value_update
playsound minecraft:block.brewing_stand.brew block @a ~ ~ ~ 1.0 1.5

#if cart is empty, reset cart
execute if score @s gm4_lt_value matches 0 run tag @s add gm4_liquid_minecart_empty
execute if score @s gm4_lt_value matches 0 as @e[type=armor_stand,limit=1,sort=nearest,tag=gm4_liquid_minecart_stand] run function gm4_liquid_minecarts:set_empty_data
