schedule function gm4_bookshelf_reading:main 1t

scoreboard players reset @e[type=text_display,tag=gm4_bookshelf_reading_display.active] gm4_bookshelf_reading_keep

execute as @a[gamemode=!spectator] run function gm4_bookshelf_reading:evaluate/run

execute as @e[type=text_display,tag=gm4_bookshelf_reading_display.active] unless score @s gm4_bookshelf_reading_keep matches 1 run function gm4_bookshelf_reading:process_display/remove/start
