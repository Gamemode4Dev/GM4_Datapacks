# scoreboard init
scoreboard objectives add gm4_count dummy
scoreboard objectives add gm4_binder_data dummy
scoreboard objectives add gm4_entity_version dummy

# base init
execute unless score book_binders gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Book Binders"}
scoreboard players set book_binders gm4_modules 1

schedule function gm4_book_binders:main 10t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 530.518644900748 ~ {CustomName:'"gm4_book_binders_guide"',Tags:["gm4_guide"],data:{type:"module",id:"book_binders",page_count:3,line_count:1,module_name:"Book Binders"}}

#$moduleUpdateList
