execute unless score poses_pack gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Poses Pack"}
execute unless score poses_pack gm4_earliest_version < poses_pack gm4_modules run scoreboard players operation poses_pack gm4_earliest_version = poses_pack gm4_modules
scoreboard players set poses_pack gm4_modules 1



#$moduleUpdateList
