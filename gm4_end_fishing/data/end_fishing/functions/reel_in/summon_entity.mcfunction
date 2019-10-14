#@s = item that is to summon a special entity
#run from reel_in/reel_loot

execute if entity @s[nbt={Item:{tag:{gm4_ef_entity:{id:"end_phantom"}}}}] as @e[type=area_effect_cloud,tag=gm4_ef_loot,limit=1,sort=nearest] at @s run summon phantom ^ ^ ^-1 {Health:26f,Size:3,Attributes:[{Name:generic.maxHealth,Base:26}],Tags:["gm4_end_phantom"],DeathLootTable:"end_fishing:entities/end_phantom"}
execute if entity @s[nbt={Item:{tag:{gm4_ef_entity:{id:"end_phantom"}}}}] run advancement grant @p[tag=gm4_ef_reel_loot,distance=..0.01] only gm4:end_fishing_phantom
execute if entity @s[nbt={Item:{tag:{gm4_ef_entity:{id:"endermite"}}}}] as @e[type=area_effect_cloud,tag=gm4_ef_loot,limit=1,sort=nearest] at @s run summon endermite ^ ^ ^1 {DeathLootTable:"end_fishing:entities/endermite"}
kill @s
