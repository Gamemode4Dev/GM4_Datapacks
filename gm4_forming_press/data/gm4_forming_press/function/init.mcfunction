scoreboard objectives add gm4_crafting dummy

execute unless score forming_press gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Forming Press"}
execute unless score forming_press gm4_earliest_version < forming_press gm4_modules run scoreboard players operation forming_press gm4_earliest_version = forming_press gm4_modules
scoreboard players set forming_press gm4_modules 1

schedule function gm4_forming_press:main 1t



#$moduleUpdateList
