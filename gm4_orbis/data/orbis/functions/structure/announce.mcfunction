kill @e[tag=gm4_orbis_structure_pos]
summon area_effect_cloud ~ ~ ~ {Tags:[gm4_orbis_structure_pos]}
execute store result score #temp_x gm4_count run data get entity @e[tag=gm4_orbis_structure_pos,limit=1] Pos[0]
execute store result score #temp_y gm4_count run data get entity @e[tag=gm4_orbis_structure_pos,limit=1] Pos[0]
execute store result score #temp_z gm4_count run data get entity @e[tag=gm4_orbis_structure_pos,limit=1] Pos[2]
tellraw @a[gamemode=!survival,gamemode=!adventure] [{"text":"Spawned structure at ","color":"green"},{"score":{"objective":"gm4_count","name":"#temp_x"},"color":"gold"}," ",{"score":{"objective":"gm4_count","name":"#temp_y"},"color":"gold"}," ",{"score":{"objective":"gm4_count","name":"#temp_z"},"color":"gold"}]
execute at @a[gamemode=!survival,gamemode=!adventure] run playsound minecraft:entity.player.levelup master @p
