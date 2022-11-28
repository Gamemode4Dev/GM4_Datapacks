execute as @a[gamemode=!spectator] run function gm4_mountaineering:player_main

# Initiate crampons when they are first equipped with a tag
tag @a[tag=!gm4_mountaineering_using_crampons,predicate=gm4_mountaineering:wearing_crampons] add gm4_mountaineering_using_crampons

# Clear crampon tag when crampons are removed
tag @a[predicate=!gm4_mountaineering:wearing_crampons,tag=gm4_mountaineering_using_crampons] remove gm4_mountaineering_using_crampons

schedule function gm4_mountaineering:main 16t
