# @s = skeleton, zombie, or creeper to be converted into a goblin
# called by event

summon zombie ~ ~ ~ {CustomName:'{"translate":"entity.gm4.goblin","fallback":"Goblin§"}',CustomNameVisible:0,Team:"gm4_hide_name",DeathLootTable:"gm4_menacing_goblins:entities/goblin",LeftHanded:1b,CanPickUpLoot:0b,Health:24f,IsBaby:1b,CanBreakDoors:0b,Tags:["gm4_goblin","smithed.entity"],HandItems:[{id:"minecraft:golden_sword",Count:1b},{}],HandDropChances:[0.3F,-327.67F],ArmorItems:[{},{},{},{id:"minecraft:carved_pumpkin",Count:1b,tag:{Enchantments:[{id:"minecraft:thorns",lvl:3s}]}}],ArmorDropChances:[2.0F,2.0F,2.0F,-327.67F],ActiveEffects:[{Id:11,Amplifier:4b,Duration:20,ShowParticles:1b}],Attributes:[{Name:"minecraft:generic.max_health",Base:24.0d},{Name:"minecraft:generic.follow_range",Base:48.0d}]}
scoreboard players set @e[type=zombie,tag=gm4_goblin,distance=0] gm4_entity_version 1

tp @e[type=zombie,limit=1,distance=0] @s
data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}
