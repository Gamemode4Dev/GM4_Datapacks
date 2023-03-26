schedule function gm4_hydromancy:main 16t

execute as @e[type=item,tag=!gm4_hy_item_checked] run function gm4_hydromancy:coral_core/create/check_item

execute as @e[type=item_display,tag=gm4_hy_coral_core] at @s run function gm4_hydromancy:coral_core/submain

# stop landed tridents from despawning
execute as @e[type=trident,tag=gm4_hy_spell_trident.landed] run data modify entity @s life set value 1s
