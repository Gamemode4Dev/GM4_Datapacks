# Show stored experience in actionbar
# @s = players looking at ender chest
# at @s
# run from point_report_ray

title @s actionbar [{"translate":"text.gm4.xp_storage.stored_experience","fallback":"Stored Experience: ","color":"green"},{"translate":"text.gm4.xp_storage.stored_experience.points","fallback":"%s Points","with":[{"score":{"name":"@s","objective":"gm4_stored_xp"}}],"color":"dark_green"}]

tag @s add gm4_xp_storage_found_echest
