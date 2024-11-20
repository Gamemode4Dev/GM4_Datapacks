# scoreboard init
scoreboard objectives add gm4_count dummy
scoreboard objectives add gm4_binder_data dummy
scoreboard objectives add gm4_entity_version dummy

# base init
execute unless score book_binders gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Book Binders"}
execute unless score book_binders gm4_earliest_version < book_binders gm4_modules run scoreboard players operation book_binders gm4_earliest_version = book_binders gm4_modules
scoreboard players set book_binders gm4_modules 1

schedule function gm4_book_binders:main 10t



#$moduleUpdateList
