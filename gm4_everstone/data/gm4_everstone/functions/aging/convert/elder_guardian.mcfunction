# converts guardian into elder guardian
# @s = guardian that reached the max age
# located at @s
# run from aging/update_age/guardian

# summon new mob
summon minecraft:elder_guardian ~ ~ ~ {Tags:[gm4_es_new_mob]}

# transfer old nbt to new mob
effect give @s nausea 1 2
data merge entity @s {Tags:[]}
data modify entity @e[type=elder_guardian,tag=gm4_es_new_mob,limit=1] {} merge from entity @s

# sound effects
playsound minecraft:entity.elder_guardian.ambient hostile @a[distance=..16] ~ ~ ~ 0.5
playsound block.redstone_torch.burnout hostile @a[distance=..16] ~ ~ ~ 0.5 .1

# clean up
data merge entity @s {DeathTime:19s,Health:0,DeathLootTable:"minecraft:empty",HandDropChances:[-327.67F,-327.67F],ArmorDropChances:[-327.67F,-327.67F,-327.67F,-327.67F]}
tp @s ~ ~-5000 ~
