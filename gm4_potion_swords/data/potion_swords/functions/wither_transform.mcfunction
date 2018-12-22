#@s = @e[type=skeleton,nbt={ActiveEffects:[{Id:20b}]}]
summon wither_skeleton ~ ~ ~ {HandItems:[{id:bow,Count:1}],ActiveEffects:[{Id:20,Amplifier:1,Duration:20}],DeathLootTable:"minecraft:empty",Team:"gm4_ps_no_coll"}
teleport @e[type=wither_skeleton,limit=1,distance=0] @s
data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}
advancement grant @p[scores={gm4_gold_sword=1..}] only gm4:potion_swords
