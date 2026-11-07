# Sets up a break interaction and mounts it on the swing main body
# @s = Interaction to be setup
# at @s
# run from gm4_swings:swing/setup

data merge entity @s {height:-0.5,Tags:["gm4_swings.interaction.hit","gm4_swings.interaction.break"]}
scoreboard players operation @s gm4_swings.id = $global gm4_swings.id

ride @s mount @n[type=minecraft:item_display,tag=gm4_swings.swing,distance=..0.1]
