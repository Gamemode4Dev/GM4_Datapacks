execute unless score lavish_livestock gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Lavish Livestock"}
execute unless score lavish_livestock gm4_earliest_version < lavish_livestock gm4_modules run scoreboard players operation lavish_livestock gm4_earliest_version = lavish_livestock gm4_modules
scoreboard players set lavish_livestock gm4_modules 1

scoreboard objectives add gm4_lavish_livestock_size dummy

#$moduleUpdateList
