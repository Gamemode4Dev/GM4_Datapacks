scoreboard objectives add gm4_disassembler dummy
scoreboard players set #100 gm4_disassembler 100
scoreboard players set #2 gm4_disassembler 2

scoreboard players set disassemblers gm4_modules 1

execute unless score disassemblers gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Disassemblers"}

schedule function disassemblers:main 1t

#$moduleUpdateList
