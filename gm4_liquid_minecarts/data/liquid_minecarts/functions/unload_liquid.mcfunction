#run from compare_unload_liquid and
#@s liquid minecart above a liquid tank that can accept the liquid

#take all the liquid in the tank (or as much as the minecart can hold) (amount of liquid to take stored in gm4_lm_data)
#get remaining space in minecart
scoreboard players operation @s gm4_lm_data = @e[type=armor_stand,limit=1,sort=nearest,tag=gm4_liquid_tank] gm4_lt_max
scoreboard players operation @s gm4_lm_data -= @e[type=armor_stand,limit=1,sort=nearest,tag=gm4_liquid_tank] gm4_lt_value
#lower lm_data if tank has less space than minecart's liquid level
scoreboard players operation @s gm4_lm_data < @s gm4_lt_value

#remove liquid from minecart
scoreboard players operation @s gm4_lt_value -= @s gm4_lm_data
#give liquid to tank
scoreboard players operation @e[type=armor_stand,limit=1,sort=nearest,tag=gm4_liquid_tank] gm4_lt_buffer += @s gm4_lm_data
#update display
function liquid_minecarts:liquid_value_update
playsound minecraft:block.brewing_stand.brew block @a ~ ~ ~ 1.0 1.5
#clear liquid tags
execute if score @s gm4_lt_value matches 0 run data merge entity @s {Tags:["gm4_liquid_minecart","gm4_liquid_minecart_empty"]}
