
data merge entity @s {DeathLootTable:"gm4_combat_expanded:boss/skeleton_minion",CustomName:{"text":"Amethyst Skeleton"},CanPickUpLoot:0b,Health:13f,CanBreakDoors:0b,Tags:["gm4_ce_processed","gm4_ce_boss.watcher","gm4_ce_boss.watcher.minion"],equipment:{head:{id:"minecraft:budding_amethyst",count:1,components:{"minecraft:enchantments":{"minecraft:blast_protection":20}}}},drop_chances:{head:0F},attributes:[{id:"minecraft:max_health",base:13},{id:"minecraft:movement_speed",base:0.215},{id:"minecraft:armor",base:8},{id:"minecraft:armor_toughness",base:2},{id:"minecraft:max_absorption",base:0}]}
scoreboard players operation @s gm4_ce_boss.id = $mob_id gm4_ce_boss.id

# set CE gear
scoreboard players set $difficulty gm4_ce_data 65
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/generic/feet
loot replace entity @s armor.legs loot gm4_combat_expanded:mob/equip_armor/generic/legs
loot replace entity @s armor.chest loot gm4_combat_expanded:mob/equip_armor/generic/chest

scoreboard players set $spawned_skeleton gm4_ce_boss 1
