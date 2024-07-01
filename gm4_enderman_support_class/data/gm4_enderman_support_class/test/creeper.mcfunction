# @template gm4:test_platform
# @batch gm4_midnight
# @beforebatch time set midnight
# @afterbatch time set noon
# @skyaccess

summon enderman ~0.5 ~1 ~0.5

summon creeper ~2.5 ~1 ~2.5

await entity @e[type=creeper,distance=..5,nbt={active_effects:[{id:"minecraft:regeneration"}]}]
