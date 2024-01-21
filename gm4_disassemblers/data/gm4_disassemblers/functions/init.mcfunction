scoreboard objectives add gm4_disassembler dummy
scoreboard players add disassemble_diamonds gm4_disassembler 0

execute unless score disassemblers gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Disassemblers"}
execute unless score disassemblers gm4_earliest_version < disassemblers gm4_modules run scoreboard players operation disassemblers gm4_earliest_version = disassemblers gm4_modules
scoreboard players set disassemblers gm4_modules 1

schedule function gm4_disassemblers:main 1t



#$moduleUpdateList
