scoreboard objectives add gm4_si_data dummy

execute unless score sign_inscriber gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Sign Inscriber"}
scoreboard players set sign_inscriber gm4_modules 1

#$moduleUpdateList
