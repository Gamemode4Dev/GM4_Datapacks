# @template gm4:test_platform

setblock ~1 ~1 ~1 rail
summon minecart ~1.5 ~1 ~1.5
setblock ~1 ~2 ~1 spawner{SpawnData:{entity:{id:"minecraft:zombie"}}}
setblock ~1 ~3 ~1 piston[facing=down]
setblock ~1 ~4 ~1 redstone_block

await entity @e[type=spawner_minecart,tag=gm4_spawner_minecart,nbt={SpawnData:{entity:{id:"minecraft:zombie"}}}] inside
