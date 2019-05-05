#@s = player looking an ender_chest
#run from point_report_ray

title @s actionbar ["",{"text":"Stored Experience : ","color":"green"},{"score":{"name":"@s","objective":"gm4_stored_xp"},"color":"dark_green"},{"text":" Points","color":"dark_green"}]

tag @s add gm4_xp_storage_found_echest
