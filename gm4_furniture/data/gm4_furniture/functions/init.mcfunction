execute unless score furniture gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Furniture"}
execute unless score furniture gm4_earliest_version < furniture gm4_modules run scoreboard players operation furniture gm4_earliest_version = furniture gm4_modules
scoreboard players set furniture gm4_modules 1

scoreboard objectives add gm4_furniture_data dummy
scoreboard objectives add gm4_furniture_last_hit dummy
scoreboard objectives add gm4_furniture_id dummy

scoreboard players set #2 gm4_furniture_data 2

schedule function gm4_furniture:main 1t

#$moduleUpdateList
