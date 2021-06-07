execute if score gm4 load.status matches 1 run scoreboard players set gm4_book_binders load.status 1
execute unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"missing",module:"Book Binders",require:"Gamemode 4"}

execute if score gm4_book_binders load.status matches 1 run function gm4_book_binders:init
execute unless score gm4_book_binders load.status matches 1 run schedule clear gm4_book_binders:main
