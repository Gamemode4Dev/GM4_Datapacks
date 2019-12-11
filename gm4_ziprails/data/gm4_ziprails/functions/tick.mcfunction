#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = ziprails gm4_clock_tick run function gm4_ziprails:main

#run 20hz if needed
execute as @e[type=#gm4:minecarts] at @s if block ~ ~1 ~ #ziprails:cable[attached=true] run function gm4_ziprails:zipping
execute as @e[type=#gm4:minecarts,tag=gm4_linked] at @s unless block ~ ~1 ~ #ziprails:cable run tag @s remove gm4_linked

schedule function gm4_ziprails:tick 1t
