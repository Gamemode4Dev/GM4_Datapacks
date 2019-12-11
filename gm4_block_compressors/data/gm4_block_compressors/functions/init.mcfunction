execute unless score block_compressors gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Block Compressors"}
scoreboard players set block_compressors gm4_modules 1

schedule function gm4_block_compressors:main 1t

#$moduleUpdateList
