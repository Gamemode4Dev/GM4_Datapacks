# makes the arborist look at their workstation
# @s = @e[tag=gm4_gv_arborist]
# at @s
# run from gm4_garden_variety:mechanics/arborist_villager/process


tag @s add gm4_gv_looking_at_job_site
data modify entity @s NoAI set value 1

execute if entity @s as @e[tag=gm4_gv_analyzer,tag=!gm4_gv_disable_job_site,distance=..15] if score @s gm4_gv_job_id = $current_id gm4_gv_job_id run tag @s add gm4_gv_look_here
execute facing entity @e[tag=gm4_gv_analyzer,tag=gm4_gv_look_here] eyes run tp @s ~ ~ ~ ~ ~
tag @e[tag=gm4_gv_analyzer,tag=gm4_gv_look_here,distance=..15] remove gm4_gv_look_here
