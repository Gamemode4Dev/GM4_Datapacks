#@s = @e[type=skeleton,nbt={active_effects:[{id:'minecraft:wither'}]}]
summon wither_skeleton ~ ~ ~ {active_effects:[{id:'minecraft:wither',amplifier:1,duration:20}],DeathLootTable:"gm4:empty"}
data modify entity @e[type=wither_skeleton,limit=1,distance=0] equipment set from entity @s equipment
teleport @e[type=wither_skeleton,limit=1,distance=0] @s
data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"gm4:empty"}
advancement grant @p[scores={gm4_gold_sword=1..}] only gm4:potion_swords
