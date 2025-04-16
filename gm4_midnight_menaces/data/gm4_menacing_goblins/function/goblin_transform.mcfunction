# @s = skeleton, zombie, or creeper to be converted into a goblin
# called by event

summon zombie ~ ~ ~ {CustomName:{"translate":"entity.gm4.goblin","fallback":"Goblin§"},CustomNameVisible:0b,Team:"gm4_hide_name",DeathLootTable:"gm4_menacing_goblins:entities/goblin",LeftHanded:1b,CanPickUpLoot:0b,Health:24f,IsBaby:1b,CanBreakDoors:0b,Tags:["gm4_goblin","smithed.entity"],equipment:{mainhand:{id:"minecraft:golden_sword",count:1},head:{id:"minecraft:carved_pumpkin",count:1,components:{"minecraft:enchantments":{"minecraft:thorns":3}}}},drop_chances:{mainhand:0.3F,head:0F},active_effects:[{id:'minecraft:resistance',amplifier:4b,duration:20,show_particles:1b}],attributes:[{id:"minecraft:max_health",base:24.0d},{id:"minecraft:follow_range",base:48.0d}]}
scoreboard players set @e[type=zombie,tag=gm4_goblin,distance=0] gm4_entity_version 1

tp @e[type=zombie,limit=1,distance=0] @s
data merge entity @s {DeathTime:19s,Health:0f,DeathLootTable:"gm4:empty"}
