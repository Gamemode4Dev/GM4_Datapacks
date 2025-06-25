
tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

tellraw @s "-= HORSE STAT TRACKER =-"
tellraw @s {text:"click here to disable",color:"red","click_event":{action:"run_command",command:"tag @s remove gm4_horse_dev"}}
tellraw @s ""
tellraw @s {text:"Tracked Horse: ",color:"red","click_event":{action:"run_command",command:"tag @s remove gm4_horse_dev"}}


execute as @e[type=#gm4_horsemanship:trainable,limit=1,sort=nearest] run return 0
