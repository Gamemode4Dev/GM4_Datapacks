# remove a text_display no longer being looked at
# @s = text_display
# at unspecified
# run from main

# schedule tick function unless it's already active
execute unless entity @e[type=text_display,tag=gm4_bookshelf_inspector_display.removing] run schedule function gm4_bookshelf_inspector:process_display/remove/tick 1t

tag @s remove gm4_bookshelf_inspector_display.active
tag @s add gm4_bookshelf_inspector_display.removing
