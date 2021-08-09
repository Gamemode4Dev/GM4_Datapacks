# run from TODO

# check if id is matching
execute if score @s gm4_gv_job_id = $current_id gm4_gv_job_id run scoreboard players add $id_checks gm4_gv_job_id 1

# check if non arborist has job site nbt
execute unless entity @s[tag=gm4_gv_arborist] run tag @s remove gm4_gv_has_job_site
execute unless entity @s[tag=gm4_gv_has_job_site] if data entity @s Brain.memories."minecraft:job_site" run tag @s add gm4_gv_has_job_site
