# @s = item that is to summon a phantom
# run from reel_in/summon_entity

execute as @e[type=marker,tag=gm4_ef_loot,limit=1] at @s run summon phantom ^ ^ ^-1 {Health:26f,Size:3,Attributes:[{Name:"generic.max_health",Base:26}],Tags:["gm4_end_phantom"],DeathLootTable:"gm4_end_fishing:entities/end_phantom"}
advancement grant @a[tag=gm4_ef_reel_loot,limit=1] only gm4:end_fishing_phantom
