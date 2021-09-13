# links the nearest villager to the analyzer
# @s = @e[tag=!gm4_gv_has_job_site,type=villager,distance=..10,limit=1,sort=nearest]
# at @s
# run from gm4_garden_variety:mechanics/arborist_villager/job_site/update_link


# link to analyzer
scoreboard players add $id_checks gm4_gv_job_id 1
scoreboard players operation @s gm4_gv_job_id = $current_id gm4_gv_job_id
tag @s add gm4_gv_has_job_site
particle happy_villager ~ ~1 ~ .3 .1 .3 .1 10
execute at @s run playsound minecraft:entity.villager.yes neutral @a ~ ~ ~ 1 0.80 

# give abrorist job
execute if entity @s[tag=!gm4_gv_arborist] at @s run function gm4_garden_variety:mechanics/arborist_villager/job/apply