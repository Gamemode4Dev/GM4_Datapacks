schedule function gm4_bookshelf_inspector:main 1t

# reset keep scores for present text_displays
scoreboard players set @e[type=text_display,tag=gm4_bookshelf_inspector_display.active] gm4_bookshelf_inspector_keep 0

# process players
execute as @a[gamemode=!spectator] run function gm4_bookshelf_inspector:evaluate/run

# remove text_displays that are not looked at
execute as @e[type=text_display,tag=gm4_bookshelf_inspector_display.active,scores={gm4_bookshelf_inspector_keep=0}] run function gm4_bookshelf_inspector:process_display/remove/start
