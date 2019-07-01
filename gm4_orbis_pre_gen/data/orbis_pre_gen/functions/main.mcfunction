scoreboard players set orbis_pre_gen_tick gm4_clock_tick 0

summon area_effect_cloud ~ ~ ~ {Tags:[gm4_orbis_gen_pos]}
execute as @e[type=area_effect_cloud,tag=gm4_orbis_gen_pos,limit=1] run function orbis_pre_gen:generate

scoreboard players add x gm4_orbis_config 16
execute if score x gm4_orbis_config > x2 gm4_orbis_config run function orbis_pre_gen:wrap

execute if score z gm4_orbis_config > z2 gm4_orbis_config run tellraw @a[gamemode=!survival,gamemode=!adventure] [{"text":"Orbis completed!","color":"green"}]
execute if score z gm4_orbis_config > z2 gm4_orbis_config run scoreboard players set pre_gen_running gm4_orbis_config 0
