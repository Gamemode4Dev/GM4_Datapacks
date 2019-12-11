scoreboard objectives add gm4_st_sand minecraft.mined:minecraft.sand
scoreboard objectives add gm4_st_random dummy

execute unless score sunken_treasure gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Sunken Treasure"}
scoreboard players set sunken_treasure gm4_modules 1

schedule function sunken_treasure:tick 1t

#$moduleUpdateList
