# @s = skeleton, zombie, or creeper to be converted into a goblin
# called by event

summon zombie ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Goblin§",{"translate":"entity.gm4.goblin"}]}',CustomNameVisible:0,Team:"gm4_hide_name",DeathLootTable:"gm4_menacing_goblins:goblin",LeftHanded:1b,CanPickUpLoot:0b,Health:24f,IsBaby:1b,CanBreakDoors:0b,Tags:["gm4_goblin"],HandItems:[{id:"minecraft:golden_sword",Count:1b},{}],HandDropChances:[0.3F,-327.67F],ArmorItems:[{},{},{},{id:"minecraft:carved_pumpkin",Count:1b,tag:{Enchantments:[{id:"minecraft:thorns",lvl:3s}]}}],ArmorDropChances:[1.0F,1.0F,1.0F,-327.67F],ActiveEffects:[{Id:11b,Amplifier:4b,Duration:20,ShowParticles:1b}],Attributes:[{Name:"minecraft:generic.max_health",Base:24.0d},{Name:"minecraft:generic.follow_range",Base:48.0d}]}
tp @e[type=zombie,limit=1,distance=0] @s
data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"minecraft:empty"}
