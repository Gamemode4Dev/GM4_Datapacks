# converts guardian into elder guardian
# @s = guardian that reached the max age
# located at @s
# run from aging/update_age/guardian

# summon new mob
summon minecraft:elder_guardian ~ ~ ~ {Tags:[gm4_es_new_mob]}

# move mob to exact location of old mob
tp @e[type=elder_guardian,tag=gm4_es_new_mob,limit=1,distance=..0.01] @s
tag @s add gm4_es_old_mob
execute on vehicle run ride @e[type=elder_guardian,tag=gm4_es_new_mob,limit=1,distance=..0.01] mount @s
execute on vehicle run ride @e[type=guardian,tag=gm4_es_old_mob,limit=1,distance=..0.01] dismount
execute on passengers run ride @s dismount

# transfer old nbt to new mob
effect give @s nausea 1 2
data merge entity @s {Tags:[]}
data modify entity @e[type=elder_guardian,tag=gm4_es_new_mob,limit=1] {} merge from entity @s

# sound effects
playsound minecraft:entity.elder_guardian.ambient hostile @a[distance=..16] ~ ~ ~ 0.5
playsound block.redstone_torch.burnout hostile @a[distance=..16] ~ ~ ~ 0.5 .1

# clean up
data merge entity @s {DeathTime:19s,Health:0,DeathLootTable:"gm4:empty",drop_chances:{mainhand:0F,offhand:0F,feet:0F,legs:0F,chest:0F,head:0F}}
tp @s ~ ~-5000 ~
