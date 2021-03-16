#@s = @e[tag=gm4_shroomite,type=area_effect_cloud,scores={gm4_shroom_time=73..}]
summon minecraft:area_effect_cloud ~ ~.2 ~ {Tags:["gm4_shroomite_spore","gm4_shroomite"],Duration:2561,Radius:0.45f,Particle:"block air"}
scoreboard players set @s gm4_shroom_time 0
