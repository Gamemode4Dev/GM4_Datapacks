scoreboard objectives add gm4_heart_can dummy

execute unless score heart_canisters gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Heart Canisters"}
execute unless score heart_canisters gm4_earliest_version < heart_canisters gm4_modules run scoreboard players operation heart_canisters gm4_earliest_version = heart_canisters gm4_modules
scoreboard players set heart_canisters gm4_modules 1

schedule function gm4_heart_canisters:main 1t

#$moduleUpdateList
