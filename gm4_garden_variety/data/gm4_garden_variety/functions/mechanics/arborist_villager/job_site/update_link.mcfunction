# links the nearest villager with no job to the analyzer
# @s = @s[tag=gm4_gv_analyzer]
# at @s
# run from gm4_garden_variety:clock/10s
# run from gm4_garden_variety:mechanics/arborist_villager/job_site/force_update


# set current id to the analyzers id
scoreboard players operation $current_id gm4_gv_job_id = @s gm4_gv_job_id

# check nearby villagers for matching id
scoreboard players set $id_checks gm4_gv_job_id 0
execute unless entity @s[tag=gm4_gv_disable_job_site] as @e[type=villager,tag=gm4_gv_arborist,distance=..10] run function gm4_garden_variety:mechanics/arborist_villager/job_site/check_villager

# check how many arborists are needed
scoreboard players set @s gm4_gv_arborist 3
scoreboard players operation @s gm4_gv_arborist -= $id_checks gm4_gv_job_id

# check for linkable villagers
scoreboard players set $link_villager_success gm4_gv_job_id 0
execute if entity @s[tag=!gm4_gv_disable_job_site] if score @s gm4_gv_arborist matches 1.. as @e[tag=!gm4_gv_has_job_site,type=villager,distance=..10,limit=1,sort=nearest] store success score $link_villager_success gm4_gv_job_id run function gm4_garden_variety:mechanics/arborist_villager/job_site/link_villager
execute if score $link_villager_success gm4_gv_job_id matches 1 run scoreboard players remove @s gm4_gv_arborist 1
execute if score $link_villager_success gm4_gv_job_id matches 1 run playsound minecraft:entity.cat.eat neutral @a[distance=..20] ~ ~ ~ 1 .5 

# tag if fully linked
execute unless entity @s[tag=gm4_gv_fully_linked] if score @s gm4_gv_arborist matches 0 run tag @s add gm4_gv_fully_linked
execute if entity @s[tag=gm4_gv_fully_linked] unless score @s gm4_gv_arborist matches 0 run tag @s remove gm4_gv_fully_linked

# show status of arborist link
execute if entity @s[tag=gm4_gv_force_update] if score @s gm4_gv_arborist matches 0 run particle happy_villager ~ ~1.2 ~ .1 .1 .1 1 3
execute if entity @s[tag=gm4_gv_force_update] if score @s gm4_gv_arborist matches 1.. run particle angry_villager ~ ~.9 ~
execute if entity @s[tag=gm4_gv_force_update] if score @s gm4_gv_arborist matches 2.. run particle angry_villager ~ ~.7 ~
execute if entity @s[tag=gm4_gv_force_update] if score @s gm4_gv_arborist matches 3.. run particle angry_villager ~ ~.5 ~
tag @s remove gm4_gv_force_update




