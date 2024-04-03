
data merge entity @s {DeathLootTable:"empty",CustomName:'{"text":"Amethyst Zombie"}',CanPickUpLoot:0b,Health:26f,IsBaby:0b,CanBreakDoors:0b,Tags:["gm4_ce_processed","gm4_ce_boss.watcher","gm4_ce_boss.watcher.minion"],ArmorItems:[{},{},{},{id:"minecraft:budding_amethyst",count:1,tag:{Enchantments:[{id:"minecraft:blast_protection",lvl:20s}]}}],ArmorDropChances:[0.085F,0.085F,0.085F,-327.670F],Attributes:[{Name:"generic.max_health",Base:26},{Name:"generic.knockback_resistance",Base:0.5},{Name:"generic.movement_speed",Base:0.24},{Name:"generic.attack_damage",Base:6},{Name:"generic.armor",Base:15},{Name:"generic.armor_toughness",Base:4},{Name:"generic.attack_knockback",Base:0.25},{Name:"generic.max_absorption",Base:0},{Name:"zombie.spawn_reinforcements",Base:0}]}
scoreboard players operation @s gm4_ce_boss.id = $mob_id gm4_ce_boss.id

# set CE gear
scoreboard players set $difficulty gm4_ce_data 85
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/generic/feet
loot replace entity @s armor.legs loot gm4_combat_expanded:mob/equip_armor/generic/legs
loot replace entity @s armor.chest loot gm4_combat_expanded:mob/equip_armor/generic/chest
item replace entity @s weapon.mainhand with air

tag @s add gm4_ce_pierce_attacks
