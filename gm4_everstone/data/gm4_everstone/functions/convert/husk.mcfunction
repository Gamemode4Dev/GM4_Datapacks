# run from aging/zombie
# @s = zombie with high age score, at @s

summon minecraft:husk ~ ~ ~ {Tags:[gm4_es_new_mob],ActiveEffects:[{Id:9,Amplifier:1,Duration:30}]}
tp @e[type=husk,tag=gm4_es_new_mob,limit=1] @s

data modify entity @e[type=husk,tag=gm4_es_new_mob,limit=1] CustomName set from entity @s CustomName
data modify entity @e[type=husk,tag=gm4_es_new_mob,limit=1] PersistenceRequired set from entity @s PersistenceRequired
data modify entity @e[type=husk,tag=gm4_es_new_mob,limit=1] Health set from entity @s Health

data modify entity @e[type=husk,tag=gm4_es_new_mob,limit=1] ArmorItems set from entity @s ArmorItems
data modify entity @e[type=husk,tag=gm4_es_new_mob,limit=1] HandItems set from entity @s HandItems
data modify entity @e[type=husk,tag=gm4_es_new_mob,limit=1] ArmorDropChances set from entity @s ArmorDropChances
data modify entity @e[type=husk,tag=gm4_es_new_mob,limit=1] HandDropChances set from entity @s HandDropChances
data modify entity @e[type=husk,tag=gm4_es_new_mob,limit=1] CanPickUpLoot set from entity @s CanPickUpLoot
data modify entity @e[type=husk,tag=gm4_es_new_mob,limit=1] CanBreakDoors set from entity @s CanBreakDoors

playsound minecraft:entity.husk.ambient hostile @a[distance=..16] ~ ~ ~ 0.5
playsound block.redstone_torch.burnout hostile @a[distance=..16] ~ ~ ~ 0.5 .1
data merge entity @s {DeathTime:19s,Health:0,DeathLootTable:"minecraft:empty",HandDropChances:[-327.67F,-327.67F],ArmorDropChances:[-327.67F,-327.67F,-327.67F,-327.67F]}
tag @e[type=husk] remove gm4_es_new_mob
