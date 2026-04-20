scoreboard objectives add gm4_calling_bell dummy

execute unless score calling_bell gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Calling Bell"}
execute unless score calling_bell gm4_earliest_version < calling_bell gm4_modules run scoreboard players operation calling_bell gm4_earliest_version = calling_bell gm4_modules
scoreboard players set calling_bell gm4_modules 1

#$moduleUpdateList
