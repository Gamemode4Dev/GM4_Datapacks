# @s = skeleton, zombie, or creeper to be converted into an illusioner
# called by event

summon illusioner ~ ~ ~ {DeathLootTable:"gm4_illusioner_nights:entities/illusioner",HandItems:[{id:"minecraft:bow",Count:1b},{}]}
tp @e[type=illusioner,limit=1,distance=0] @s
data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}
