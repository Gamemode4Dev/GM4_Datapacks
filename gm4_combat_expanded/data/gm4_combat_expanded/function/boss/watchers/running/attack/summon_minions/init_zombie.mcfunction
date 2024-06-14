
data merge entity @s {DeathLootTable:"gm4_combat_expanded:boss/zombie_minion",CustomName:'{"text":"Amethyst Zombie"}',CanPickUpLoot:0b,Health:16f,IsBaby:0b,CanBreakDoors:0b,Tags:["gm4_ce_processed","gm4_ce_boss.watcher","gm4_ce_boss.watcher.minion"],ArmorItems:[{},{},{},{id:"minecraft:budding_amethyst",count:1,components:{"minecraft:enchantments":{"minecraft:blast_protection":20}}}],ArmorDropChances:[0.085F,0.085F,0.085F,-327.670F],Attributes:[{Name:"generic.max_health",Base:16},{Name:"generic.knockback_resistance",Base:0.15},{Name:"generic.movement_speed",Base:0.242},{Name:"generic.attack_damage",Base:5},{Name:"generic.armor",Base:10},{Name:"generic.armor_toughness",Base:4},{Name:"generic.max_absorption",Base:0},{Name:"zombie.spawn_reinforcements",Base:0}]}
scoreboard players operation @s gm4_ce_boss.id = $mob_id gm4_ce_boss.id

# set CE gear
scoreboard players set $difficulty gm4_ce_data 85
loot replace entity @s armor.feet loot gm4_combat_expanded:mob/equip_armor/generic/feet
loot replace entity @s armor.legs loot gm4_combat_expanded:mob/equip_armor/generic/legs
loot replace entity @s armor.chest loot gm4_combat_expanded:mob/equip_armor/generic/chest
item replace entity @s weapon.mainhand with air
