
data merge entity @s {DeathLootTable:"gm4_combat_expanded:boss/skeleton_minion",CustomName:'{"text":"Amethyst Skeleton"}',CanPickUpLoot:0b,Health:13f,CanBreakDoors:0b,Tags:["gm4_ce_processed","gm4_ce_boss.watcher","gm4_ce_boss.watcher.minion"],ArmorItems:[{},{},{},{id:"minecraft:budding_amethyst",count:1,components:{"minecraft:enchantments":{"minecraft:blast_protection":20}}}],ArmorDropChances:[0.085F,0.085F,0.085F,-327.670F],attributes:[{id:"minecraft:generic.max_health",base:13},{id:"minecraft:generic.movement_speed",base:0.215},{id:"minecraft:generic.armor",base:8},{id:"minecraft:generic.armor_toughness",base:2},{id:"minecraft:generic.max_absorption",base:0}]}
scoreboard players operation @s gm4_ce_boss.id = $mob_id gm4_ce_boss.id

# set CE gear
scoreboard players set $difficulty gm4_ce_data 65
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/generic/feet
loot replace entity @s armor.legs loot gm4_combat_expanded:mob/equip_armor/generic/legs
loot replace entity @s armor.chest loot gm4_combat_expanded:mob/equip_armor/generic/chest

scoreboard players set $spawned_skeleton gm4_ce_boss 1
