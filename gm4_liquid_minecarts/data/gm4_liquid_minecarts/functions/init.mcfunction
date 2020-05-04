scoreboard objectives add gm4_lm_data dummy
scoreboard players set #5 gm4_lm_data 5
scoreboard players set #2 gm4_lm_data 2
scoreboard players set #100 gm4_lm_data 100

data merge storage gm4_liquid_minecarts:compare {liquid:"null"}

execute unless score liquid_minecarts gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Liquid Minecarts"}
scoreboard players set liquid_minecarts gm4_modules 1

schedule function gm4_liquid_minecarts:main 1t

#$moduleUpdateList
