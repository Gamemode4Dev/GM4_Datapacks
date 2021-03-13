#@s = item that is to summon a phantom
#run from reel_in/summon_entity

execute as @e[type=area_effect_cloud,tag=gm4_ef_loot,limit=1,sort=nearest] at @s run summon phantom ^ ^ ^-1 {Health:26f,Size:3,Attributes:[{Name:"generic.max_health",Base:26}],Tags:["gm4_end_phantom"],DeathLootTable:"gm4_end_fishing:entities/end_phantom"}
advancement grant @p[tag=gm4_ef_reel_loot,distance=..0.01] only gm4:end_fishing_phantom
