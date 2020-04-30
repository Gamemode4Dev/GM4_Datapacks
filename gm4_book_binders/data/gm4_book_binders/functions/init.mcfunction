# scoreboard init
scoreboard objectives add gm4_count dummy
scoreboard objectives add gm4_binder_data dummy

# base init
execute unless score book_binders gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Book Binders"}
scoreboard players set book_binders gm4_modules 1

schedule function gm4_book_binders:main 10t

#$moduleUpdateList
