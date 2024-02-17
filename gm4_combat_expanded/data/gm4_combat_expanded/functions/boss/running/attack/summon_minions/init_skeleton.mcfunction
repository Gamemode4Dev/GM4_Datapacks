
data merge entity @s {DeathLootTable:"empty",CustomName:'{"text":"Amethyst Skeleton"}',CanPickUpLoot:0b,Health:23f,IsBaby:0b,CanBreakDoors:0b,Tags:["gm4_ce_processed","gm4_ce_boss","gm4_ce_boss.minion"],ArmorItems:[{},{},{},{id:"minecraft:budding_amethyst",Count:1b,tag:{Enchantments:[{id:"minecraft:blast_protection",lvl:20s}]}}],ArmorDropChances:[0.085F,0.085F,0.085F,-327.670F],Attributes:[{Name:"generic.max_health",Base:23},{Name:"generic.knockback_resistance",Base:0.15},{Name:"generic.movement_speed",Base:0.25},{Name:"generic.armor",Base:8},{Name:"generic.armor_toughness",Base:3},{Name:"generic.max_absorption",Base:0}]}
scoreboard players operation @s gm4_ce_boss.id = $mob_id gm4_ce_boss.id

# set CE gear
scoreboard players set $difficulty gm4_ce_data 65
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/generic/feet
loot replace entity @s armor.legs loot gm4_combat_expanded:mob/equip_armor/generic/legs
loot replace entity @s armor.chest loot gm4_combat_expanded:mob/equip_armor/generic/chest

tag @s add gm4_ce_pierce_attacks

scoreboard players set $spawned_skeleton gm4_ce_boss 1
