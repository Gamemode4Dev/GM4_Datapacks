# scheduled from main and self
schedule function gm4_lightning_in_a_bottle:brewing_stand/texture_connector/process 16t

# process texture connectors for removal or texture change
execute as @e[type=item_display,tag=gm4_lightning_rod_texture_connector] at @s run function gm4_lightning_in_a_bottle:brewing_stand/texture_connector/update
