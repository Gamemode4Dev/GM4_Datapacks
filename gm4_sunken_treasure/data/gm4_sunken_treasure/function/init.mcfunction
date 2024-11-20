scoreboard objectives add gm4_st_sand minecraft.mined:minecraft.sand
scoreboard objectives add gm4_st_gravel minecraft.mined:minecraft.gravel
scoreboard objectives add gm4_st_random dummy

execute unless score sunken_treasure gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Sunken Treasure"}
execute unless score sunken_treasure gm4_earliest_version < sunken_treasure gm4_modules run scoreboard players operation sunken_treasure gm4_earliest_version = sunken_treasure gm4_modules
scoreboard players set sunken_treasure gm4_modules 1

schedule function gm4_sunken_treasure:tick 1t



#$moduleUpdateList
