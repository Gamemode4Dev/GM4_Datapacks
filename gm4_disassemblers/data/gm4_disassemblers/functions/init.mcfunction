scoreboard objectives add gm4_disassembler dummy
scoreboard players add disassemble_diamonds gm4_disassembler 0

execute unless score disassemblers gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Disassemblers"}
scoreboard players set disassemblers gm4_modules 1

schedule function gm4_disassemblers:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 897.579163823216 ~ {CustomName:'"gm4_disassemblers_guide"',Tags:["gm4_guide"],data:{type:"module",id:"disassemblers",page_count:2,line_count:1,module_name:"Disassemblers"}}

#$moduleUpdateList
