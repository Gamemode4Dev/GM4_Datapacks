summon area_effect_cloud ~ ~ ~ {Tags:[gm4_orbis_gen_pos]}
execute as @e[type=area_effect_cloud,tag=gm4_orbis_gen_pos,limit=1] run function orbis:generate

scoreboard players add x gm4_orbis_config 16
execute if score x gm4_orbis_config > x2 gm4_orbis_config run tellraw @a[gamemode=!survival,gamemode=!adventure] ["Progress: ",{"score":{"objective":"gm4_orbis_config","name":"z"}}]
execute if score x gm4_orbis_config > x2 gm4_orbis_config run scoreboard players add z gm4_orbis_config 16
execute if score x gm4_orbis_config > x2 gm4_orbis_config run scoreboard players operation x gm4_orbis_config = x1 gm4_orbis_config

execute if score z gm4_orbis_config > z2 gm4_orbis_config run tellraw @a[gamemode=!survival,gamemode=!adventure] [{"text":"Orbis completed!","color":"green"}]
execute if score z gm4_orbis_config > z2 gm4_orbis_config run scoreboard players set pre_gen_running gm4_orbis_config 0
