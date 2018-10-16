#compares assigned run tick to current tick and calls main
execute if score gm4_currentTick gm4_clockTick = ziprails gm4_clockTick run function ziprails:main

#run 20hz if needed
execute as @e[tag=gm4_minecart] at @s if block ~ ~1 ~ #ziprails:cable[attached=true] run function ziprails:zipping
execute as @e[tag=gm4_minecart,tag=gm4_linked] at @s unless block ~ ~1 ~ #ziprails:cable run tag @s remove gm4_linked
