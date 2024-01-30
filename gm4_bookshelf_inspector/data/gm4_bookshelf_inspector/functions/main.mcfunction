schedule function gm4_bookshelf_inspector:main 8t

# reset keep scores for present text_displays
scoreboard players set @e[type=text_display,tag=gm4_bookshelf_inspector_display.active] gm4_bookshelf_inspector_keep 0

# process players
execute as @a[gamemode=!spectator] run function gm4_bookshelf_inspector:evaluate/run

# reset player scores
scoreboard players reset @a gm4_bookshelf_inspector_walk
scoreboard players reset @a gm4_bookshelf_inspector_sprint
scoreboard players reset @a gm4_bookshelf_inspector_fall

# remove text_displays that are not looked at
execute as @e[type=text_display,tag=gm4_bookshelf_inspector_display.active,scores={gm4_bookshelf_inspector_keep=0}] run function gm4_bookshelf_inspector:process_display/remove/start
