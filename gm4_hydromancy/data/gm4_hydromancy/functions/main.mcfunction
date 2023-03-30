schedule function gm4_hydromancy:main 16t

# process items
execute as @e[type=item,tag=!gm4_hy_item_checked,tag=!smithed.strict] run function gm4_hydromancy:coral_core/create/check_item

# coral core particles and sounds
execute as @e[type=item_display,tag=gm4_hy_coral_core] at @s run function gm4_hydromancy:coral_core/submain

# stop landed tridents from despawning
execute as @e[type=trident,tag=gm4_hy_spell_trident.landed] run data modify entity @s life set value 1s

# send charge from fish to flowering coral
execute as @e[type=tropical_fish,tag=gm4_hy_charged_fish] at @s if entity @e[type=marker,tag=gm4_hy_coral_vine.alive,tag=gm4_hy_coral_vine.flowering,distance=..1.5] run function gm4_hydromancy:fish/discharge
