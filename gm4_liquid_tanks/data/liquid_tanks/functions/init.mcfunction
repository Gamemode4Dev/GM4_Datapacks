scoreboard objectives add gm4_lt_value dummy
scoreboard objectives add gm4_lt_max dummy
scoreboard objectives add gm4_lt_buffer dummy
#scoreboard objectives add gm4_lt_disp_max
scoreboard objectives add gm4_lt_disp_val dummy
scoreboard objectives add gm4_lt_util dummy

scoreboard players set liquid_tanks gm4_modules 1

execute unless score liquid_tanks gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Liquid Tanks"}

schedule function liquid_tanks:main 1t
schedule function liquid_tanks:tick 1t

#$moduleUpdateList
