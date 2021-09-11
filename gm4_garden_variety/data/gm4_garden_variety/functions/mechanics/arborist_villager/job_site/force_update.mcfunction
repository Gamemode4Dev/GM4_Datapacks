# TODO

# disable nearby anazlyers from force updating
tag @e[tag=gm4_gv_analyzer,distance=1..5] add gm4_gv_analyzer_disable_check

# tags
tag @s add gm4_gv_force_update

# force update
function gm4_garden_variety:mechanics/arborist_villager/job_site/update_link

# consume emeralds
scoreboard players remove $slot_0_amount gm4_gv_analyzer 3
execute if score $link_villager_success gm4_gv_job_id matches 1 store result block ~ ~ ~ Items[{Slot:0b}].Count byte 1 run scoreboard players get $slot_0_amount gm4_gv_analyze



