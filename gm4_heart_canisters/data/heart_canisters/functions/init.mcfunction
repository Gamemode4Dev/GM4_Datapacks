scoreboard objectives add gm4_heart_can dummy

scoreboard players set heart_canisters gm4_modules 1

execute unless score heart_canisters gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Heart Canisters"}

schedule function heart_canisters:main 1t

#$moduleUpdateList
