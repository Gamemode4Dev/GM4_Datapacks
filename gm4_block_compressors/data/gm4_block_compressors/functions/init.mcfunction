execute unless score block_compressors gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Block Compressors"}
execute unless score block_compressors gm4_earliest_version < block_compressors gm4_modules run scoreboard players operation block_compressors gm4_earliest_version = block_compressors gm4_modules
scoreboard players set block_compressors gm4_modules 1

scoreboard objectives add gm4_bc_data dummy

schedule function gm4_block_compressors:main 1t



#$moduleUpdateList
