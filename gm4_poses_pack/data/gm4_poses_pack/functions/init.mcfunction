execute unless score poses_pack gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Poses Pack"}
scoreboard players set poses_pack gm4_modules 1

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3414.068129918655 ~ {CustomName:'"gm4_poses_pack_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"better_armour_stands",id:"poses_pack",page_count:2,line_count:1,module_name:"Poses Pack"}}

#$moduleUpdateList
