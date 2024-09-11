#@s liquid minecart that can accept the current tank's liquid, at liquid tank block location
#run from compare_load_liquid and init_liquid

#take all the liquid in the tank (or as much as the minecart can hold) (amount of liquid to take stored in gm4_lm_data)
#get remaining space in minecart
scoreboard players operation @s gm4_lm_data = @s gm4_lt_max
scoreboard players operation @s gm4_lm_data -= @s gm4_lt_value
#lower lm_data if tank has less liquid than the remaining space
scoreboard players operation @s gm4_lm_data < @e[type=marker,limit=1,sort=nearest,tag=gm4_liquid_tank] gm4_lt_value

#add liquid to minecart
scoreboard players operation @s gm4_lt_value += @s gm4_lm_data
#take liquid from tank
scoreboard players operation @e[type=marker,limit=1,sort=nearest,tag=gm4_liquid_tank] gm4_lt_value -= @s gm4_lm_data
#update display
function gm4_liquid_minecarts:liquid_value_update
execute as @e[type=marker,limit=1,sort=nearest,tag=gm4_liquid_tank] run function gm4_liquid_tanks:liquid_value_update
playsound minecraft:block.brewing_stand.brew block @a
