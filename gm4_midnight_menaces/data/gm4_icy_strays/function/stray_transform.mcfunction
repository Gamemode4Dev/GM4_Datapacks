# @s = skeleton to be converted into a stray
# called by event

summon stray ~ ~ ~ {HandItems:[{id:"minecraft:bow",count:1},{}],DeathLootTable:"gm4_icy_strays:entities/icy_stray"}
tp @e[type=stray,limit=1,distance=0] @s
data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}
