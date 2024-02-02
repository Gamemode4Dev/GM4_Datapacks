schedule function gm4_bookshelf_inspector:main 8t

# reset keep scores for present text_displays
scoreboard players set @e[type=text_display,tag=gm4_bookshelf_inspector_display.active] gm4_bookshelf_inspector_keep 0

# process players
# do not check for chiseled bookshelves if the player moved anyway, allow some leniency for walking to avoid nudging removing the display
execute as @a[gamemode=!spectator] unless score @s gm4_bookshelf_inspector_walk matches 100.. unless score @s gm4_bookshelf_inspector_sprint matches 1.. unless score @s gm4_bookshelf_inspector_fall matches 1.. run function gm4_bookshelf_inspector:evaluate/run

# reset player scores
scoreboard players reset @a gm4_bookshelf_inspector_walk
scoreboard players reset @a gm4_bookshelf_inspector_sprint
scoreboard players reset @a gm4_bookshelf_inspector_fall

# remove text_displays that are not looked at
execute as @e[type=text_display,tag=gm4_bookshelf_inspector_display.active,scores={gm4_bookshelf_inspector_keep=0}] run function gm4_bookshelf_inspector:process_display/remove/start
