scoreboard objectives add gm4_lt_value dummy
scoreboard objectives add gm4_lt_max dummy
scoreboard objectives add gm4_lt_prior_val dummy
scoreboard objectives add gm4_lt_disp_val dummy
scoreboard objectives add gm4_lt_util dummy
#declare storage gm4_liquid_tanks:temp

execute unless score liquid_tanks gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Liquid Tanks"}
execute unless score liquid_tanks gm4_earliest_version < liquid_tanks gm4_modules run scoreboard players operation liquid_tanks gm4_earliest_version = liquid_tanks gm4_modules
scoreboard players set liquid_tanks gm4_modules 1

schedule function gm4_liquid_tanks:main 1t



#$moduleUpdateList
