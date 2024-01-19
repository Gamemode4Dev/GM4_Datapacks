execute unless score ziprails gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Ziprails"}
execute unless score ziprails gm4_earliest_version < ziprails gm4_modules run scoreboard players operation ziprails gm4_earliest_version = ziprails gm4_modules
scoreboard players set ziprails gm4_modules 1

schedule function gm4_ziprails:main 1t



#$moduleUpdateList
