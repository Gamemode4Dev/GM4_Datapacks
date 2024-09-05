scoreboard objectives add gm4_es_data dummy
scoreboard objectives add gm4_es_age dummy
scoreboard objectives add gm4_es_mine minecraft.mined:minecraft.stone
# set chance (out of 100) for a single mob to age every 30s
# 10 = on average, a mob ages every 5 minutes
scoreboard players set #chance gm4_es_data 10

execute unless score everstone gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Everstone"}
execute unless score everstone gm4_earliest_version < everstone gm4_modules run scoreboard players operation everstone gm4_earliest_version = everstone gm4_modules
scoreboard players set everstone gm4_modules 1

schedule function gm4_everstone:main 1t
schedule function gm4_everstone:tick 1t
schedule function gm4_everstone:aging_clock 1t



#$moduleUpdateList
