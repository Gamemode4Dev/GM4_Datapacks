#@s = player looking an ender_chest
#run from point_report_ray

title @s actionbar [{"translate":"%1$s","with":["Stored Experience: ",{"translate":"text.gm4.xp_storage.stored_experience"}],"color":"green"},{"translate":"%1$s","with":[[{"score":{"name":"@s","objective":"gm4_stored_xp"}}," Points"],{"translate":"text.gm4.xp_storage.stored_experience.points","with":[{"score":{"name":"@s","objective":"gm4_stored_xp"}}]}],"color":"dark_green"}]

tag @s add gm4_xp_storage_found_echest
