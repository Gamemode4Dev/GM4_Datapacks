# updates every 10 seconds
# run from gm4_garden_variety:init


schedule function gm4_garden_variety:clock/10s 10s

# get current time
execute store result score $current_time gm4_gv_arborist run time query daytime

# check if analyzer has linked arborists nearby, if not then create more
execute as @e[type=armor_stand,tag=gm4_gv_analyzer,tag=!gm4_gv_force_update,sort=random] at @s run function gm4_garden_variety:mechanics/arborist_villager/job_site/update_link

# update arborist
execute as @e[type=villager,tag=gm4_gv_arborist,sort=random] at @s run function gm4_garden_variety:mechanics/arborist_villager/process
