#@s = zombie villager attacked by player with transmutation stone
#Run from mobs/check_charge

summon illusioner ~ ~ ~ {Health:26f}
teleport @e[type=illusioner,limit=1,distance=0] @s
data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}

playsound minecraft:entity.evoker.prepare_attack player @a[distance=..6] ~ ~ ~ 0.3 1.5
