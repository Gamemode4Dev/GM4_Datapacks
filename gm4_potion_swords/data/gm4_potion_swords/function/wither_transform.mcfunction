#@s = @e[type=skeleton,nbt={active_effects:[{id:'minecraft:wither'}]}]
summon wither_skeleton ~ ~ ~ {active_effects:[{id:'minecraft:wither',amplifier:1,duration:20}],DeathLootTable:"minecraft:empty"}
data modify entity @e[type=wither_skeleton,limit=1,distance=0] ArmorItems set from entity @s ArmorItems
data modify entity @e[type=wither_skeleton,limit=1,distance=0] HandItems set from entity @s HandItems
teleport @e[type=wither_skeleton,limit=1,distance=0] @s
data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}
advancement grant @p[scores={gm4_gold_sword=1..}] only gm4:potion_swords
