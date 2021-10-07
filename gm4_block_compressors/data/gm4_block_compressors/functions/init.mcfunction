execute unless score block_compressors gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Block Compressors"}
scoreboard players set block_compressors gm4_modules 1

scoreboard objectives add gm4_bc_data dummy

schedule function gm4_block_compressors:main 1t

# guidebook
summon marker ~ 507.561571027715 ~ {CustomName:'"gm4_block_compressors_guide"',Tags:["gm4_guide"],data:{type:"module",id:"block_compressors",page_count:1,line_count:1,module_name:"Block Compressors"}}

#$moduleUpdateList
