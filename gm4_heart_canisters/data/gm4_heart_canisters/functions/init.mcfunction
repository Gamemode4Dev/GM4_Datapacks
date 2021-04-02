scoreboard objectives add gm4_heart_can dummy

execute unless score heart_canisters gm4_modules matches 2 run data modify storage gm4:log queue append value {type:"install",module:"Heart Canisters"}
scoreboard players set heart_canisters gm4_modules 2

schedule function gm4_heart_canisters:main 1t

#$moduleUpdateList
