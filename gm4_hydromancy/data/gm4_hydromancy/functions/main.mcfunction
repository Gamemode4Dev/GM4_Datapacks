schedule function gm4_hydromancy:main 16t

execute as @e[type=item,tag=!gm4_hy_item_checked] run function gm4_hydromancy:coral_flower/create/check_item

execute as @e[type=item_display,tag=gm4_hy_coral_flower] at @s run function gm4_hydromancy:coral_flower/submain
