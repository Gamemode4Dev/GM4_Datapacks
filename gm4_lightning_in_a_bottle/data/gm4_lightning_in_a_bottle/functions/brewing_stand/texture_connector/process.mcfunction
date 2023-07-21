
# remove texture_connectors that are not in a brewing stand
execute as @e[type=item_display,tag=gm4_lightning_rod_texture_connector] at @s unless block ~ ~-0.1 ~ minecraft:brewing_stand run kill @s

# self schedule
schedule function gm4_lightning_in_a_bottle:brewing_stand/texture_connector/process 16t
