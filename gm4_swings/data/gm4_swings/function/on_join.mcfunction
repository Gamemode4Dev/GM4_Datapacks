scoreboard players set @s gm4_swings.on_join 0

# stop sitting, kill seat
tag @s remove gm4_swings.swing_sitter
execute on vehicle if entity @s[type=minecraft:item_display,tag=gm4_swings.swing_seat] run function gm4_swings:seat/kill

# try to remount
tag @s add gm4_swings.interacter
tag @s remove gm4_swings.interacter
