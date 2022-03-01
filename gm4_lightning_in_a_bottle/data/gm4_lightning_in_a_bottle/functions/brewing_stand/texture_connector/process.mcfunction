
# remove texture_connectors that are not in a brewing stand
execute as @e[type=armor_stand,tag=gm4_lightning_rod_texture_connector] at @s unless block ~ ~ ~ minecraft:brewing_stand run kill @s

# self schedule
schedule function gm4_lightning_in_a_bottle:brewing_stand/texture_connector/process 16t
