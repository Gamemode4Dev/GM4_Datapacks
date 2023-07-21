execute unless score dangerous_dungeons gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Dangerous Dungeons"}
execute unless score dangerous_dungeons gm4_earliest_version < dangerous_dungeons gm4_modules run scoreboard players operation dangerous_dungeons gm4_earliest_version = dangerous_dungeons gm4_modules
scoreboard players set dangerous_dungeons gm4_modules 1

# guidebook


#$moduleUpdateList
