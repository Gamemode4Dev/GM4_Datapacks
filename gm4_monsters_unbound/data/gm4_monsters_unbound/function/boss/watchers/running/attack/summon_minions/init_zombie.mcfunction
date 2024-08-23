
data merge entity @s {DeathLootTable:"gm4_monsters_unbound:boss/zombie_minion",CustomName:'{"text":"Amethyst Zombie"}',CanPickUpLoot:0b,Health:16f,IsBaby:0b,CanBreakDoors:0b,Tags:["gm4_sr_processed","gm4_mu_boss.watcher","gm4_mu_boss.watcher.minion"],ArmorItems:[{},{},{},{id:"minecraft:budding_amethyst",count:1,components:{"minecraft:enchantments":{"minecraft:blast_protection":20}}}],ArmorDropChances:[0.085F,0.085F,0.085F,-327.670F],attributes:[{id:"minecraft:generic.max_health",base:16},{id:"minecraft:generic.knockback_resistance",base:0.15},{id:"minecraft:generic.movement_speed",base:0.242},{id:"minecraft:generic.attack_damage",base:4},{id:"minecraft:generic.armor",base:10},{id:"minecraft:generic.armor_toughness",base:4},{id:"minecraft:generic.max_absorption",base:0},{id:"zombie.spawn_reinforcements",base:0}]}
scoreboard players operation @s gm4_mu_boss.id = $mob_id gm4_mu_boss.id

# set CE gear
scoreboard players set $difficulty gm4_mu_data 85
scoreboard players set $armor_chance gm4_sr_data 15
loot replace entity @s armor.feet loot gm4_survival_refightalized:mob/equip_armor/generic/feet
loot replace entity @s armor.legs loot gm4_survival_refightalized:mob/equip_armor/generic/legs
loot replace entity @s armor.chest loot gm4_survival_refightalized:mob/equip_armor/generic/chest
item replace entity @s weapon.mainhand with air
