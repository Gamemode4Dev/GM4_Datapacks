# processes the arborist
# @s = @e[type=villager,tag=gm4_gv_arborist,sort=random]
# at @s
# run from gm4_garden_variety:clock/1s


# get villagers xp
execute store result score $xp_value gm4_gv_arborist run data get entity @s Xp

# lock job, if villager has gained xp
execute if entity @s[tag=!gm4_gv_locked_job] if score $xp_value gm4_gv_arborist matches 1.. run tag @s add gm4_gv_locked_job

# set current id to the arborists id
scoreboard players operation $current_id gm4_gv_job_id = @s gm4_gv_job_id

# check if job site is nearby
scoreboard players set $verify_job_site gm4_gv_job_id 0
execute if entity @s as @e[tag=gm4_gv_analyzer,tag=!gm4_gv_disable_job_site,distance=..25] if score @s gm4_gv_job_id = $current_id gm4_gv_job_id run scoreboard players set $verify_job_site gm4_gv_job_id 1
execute if score $verify_job_site gm4_gv_job_id matches 0 run function gm4_garden_variety:mechanics/arborist_villager/job/missing_job_site

# working time
execute if score $current_time gm4_gv_arborist matches 1750..2000 run scoreboard players set @s gm4_gv_trades 2 
execute if score $current_time gm4_gv_arborist matches 2000..6000 run function gm4_garden_variety:mechanics/arborist_villager/working

# level up villager
execute if entity @s[tag=gm4_gv_level_1] if score $xp_value gm4_gv_arborist matches 10.. run particle dust 0.529 0.871 0.384 1 ~ ~1 ~ .3 .4 .3 .1 10
execute if entity @s[tag=gm4_gv_level_1] if score $xp_value gm4_gv_arborist matches 10.. run function gm4_garden_variety:mechanics/arborist_villager/levels/level_2
execute if entity @s[tag=gm4_gv_level_2] if score $xp_value gm4_gv_arborist matches 70.. run particle dust 0.529 0.871 0.384 1 ~ ~1 ~ .3 .4 .3 .1 10
execute if entity @s[tag=gm4_gv_level_2] if score $xp_value gm4_gv_arborist matches 70.. run function gm4_garden_variety:mechanics/arborist_villager/levels/level_3
execute if entity @s[tag=gm4_gv_level_3] if score $xp_value gm4_gv_arborist matches 150.. run particle dust 0.529 0.871 0.384 1 ~ ~1 ~ .3 .4 .3 .1 10
execute if entity @s[tag=gm4_gv_level_3] if score $xp_value gm4_gv_arborist matches 150.. run function gm4_garden_variety:mechanics/arborist_villager/levels/level_4
execute if entity @s[tag=gm4_gv_level_4] if score $xp_value gm4_gv_arborist matches 250.. run particle dust 0.529 0.871 0.384 1 ~ ~1 ~ .3 .4 .3 .1 10
execute if entity @s[tag=gm4_gv_level_4] if score $xp_value gm4_gv_arborist matches 250.. run function gm4_garden_variety:mechanics/arborist_villager/levels/level_5

# look at work site (telltale villagers)
execute store success score $look_at_job_site gm4_gv_arborist if entity @a[distance=..2,nbt={SelectedItem:{id:"minecraft:smoker"}}] 
execute if score $look_at_job_site gm4_gv_arborist matches 1 if entity @s[tag=!gm4_gv_looking_at_job_site] run function gm4_garden_variety:mechanics/arborist_villager/job/look_at_job_site
execute if score $look_at_job_site gm4_gv_arborist matches 0 if entity @s[tag=gm4_gv_looking_at_job_site] run data modify entity @s NoAI set value 0
execute if score $look_at_job_site gm4_gv_arborist matches 0 if entity @s[tag=gm4_gv_looking_at_job_site] run tag @s remove gm4_gv_looking_at_job_site
