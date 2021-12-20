scoreboard objectives add gm4_nbi_play minecraft.custom:minecraft.play_noteblock
scoreboard objectives add gm4_nbi_tune minecraft.custom:minecraft.tune_noteblock
scoreboard objectives add gm4_nbi_ray dummy
scoreboard objectives add gm4_nbi_change dummy

execute unless score note_block_interface gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Note Block Interface"}
scoreboard players set note_block_interface gm4_modules 1

schedule function gm4_note_block_interface:tick 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3002.561659162328 ~ {CustomName:'"gm4_note_block_interface_guide"',Tags:["gm4_guide"],data:{type:"module",id:"note_block_interface",page_count:1,line_count:1,module_name:"Note Block Interface"}}

#$moduleUpdateList
