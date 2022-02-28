# run from mobs/initiate
# @s = husk
# at @s

# calculate stats based on difficulty
scoreboard players operation $mob_stats gm4_ai_data += $difficulty gm4_ai_data
execute if score $difficulty gm4_ai_data matches 4.. run scoreboard players add $mob_armor gm4_ai_data 1
execute if score $difficulty gm4_ai_data matches 4.. run scoreboard players add $mob_toughness gm4_ai_data 1
execute if score $difficulty gm4_ai_data matches 8.. run scoreboard players add $mob_speed gm4_ai_data 1
execute if score $difficulty gm4_ai_data matches 8.. run scoreboard players add $mob_damage gm4_ai_data 2
execute if score $difficulty gm4_ai_data matches 8.. run scoreboard players add $mob_armor gm4_ai_data 2

# spawn a second husk if difficulty >= 11
execute if score $difficulty gm4_ai_data matches 11.. if entity @s[tag=!gm4_ai_extra_mob] store success score $mob_extras gm4_ai_data run summon husk ~ ~ ~ {Tags:["gm4_ai_extra_mob"]}

# biome specific modifiers for this mob
execute if predicate gm4_armor_identification:mobs/modifiers/dark run scoreboard players add $mob_toughness gm4_ai_data 1
execute if predicate gm4_armor_identification:mobs/modifiers/dark run attribute @s zombie.spawn_reinforcements modifier add 88708a3a-b8f0-46f8-8dd9-1f8fb0f315d6 "gm4_ai_modifier_dark" 0.25 multiply_base
execute if predicate gm4_armor_identification:mobs/modifiers/snowy run tag @s add gm4_ai_slowing_attacks
execute if predicate gm4_armor_identification:mobs/modifiers/burned run function gm4_armor_identification:mobs/biomes/burned_husk
execute if predicate gm4_armor_identification:mobs/modifiers/mountainous run scoreboard players add $mob_armor gm4_ai_data 2
execute if predicate gm4_armor_identification:mobs/modifiers/mountainous run attribute @s generic.attack_knockback modifier add 049693ea-5ae7-4a23-b075-407c65e0b103 "gm4_ai_modifier_mountainous" 2 add
execute if predicate gm4_armor_identification:mobs/modifiers/mountainous run attribute @s zombie.spawn_reinforcements modifier add 8650cbae-ca74-423f-96c6-eba2c1c8e80e "gm4_ai_modifier_mountainous" -1 multiply
execute if predicate gm4_armor_identification:mobs/modifiers/flowering run attribute @s generic.max_health modifier add 8650cbae-ca74-423f-96c6-eba2c1c8e80e "gm4_ai_modifier_flowering" -0.25 multiply
execute if predicate gm4_armor_identification:mobs/modifiers/flowering run data modify entity @s ArmorDropChances[3] set value 2F
execute if predicate gm4_armor_identification:mobs/modifiers/toxic run tag @s add gm4_ai_weakness_attacks
execute if predicate gm4_armor_identification:mobs/modifiers/growth run attribute @s generic.max_health modifier add f1f26b22-9f93-4fea-8416-96bae6867d80 "gm4_ai_modifier_growth" -0.25 multiply
execute if predicate gm4_armor_identification:mobs/modifiers/growth run attribute @s generic.attack_damage modifier add f1f26b22-9f93-4fea-8416-96bae6867d80 "gm4_ai_modifier_growth" -0.15 multiply
execute if predicate gm4_armor_identification:mobs/modifiers/growth if entity @s[tag=!gm4_ai_extra_mob] store success score $mob_extras gm4_ai_data run summon husk ~ ~ ~ {Tags:["gm4_ai_extra_mob"]}
execute if predicate gm4_armor_identification:mobs/modifiers/growth if entity @s[tag=!gm4_ai_extra_mob] store success score $mob_extras gm4_ai_data run summon husk ~ ~ ~ {Tags:["gm4_ai_extra_mob"]}
execute if predicate gm4_armor_identification:mobs/modifiers/growth if entity @s[tag=!gm4_ai_extra_mob] store success score $mob_extras gm4_ai_data run summon husk ~ ~ ~ {Tags:["gm4_ai_extra_mob"]}

# set armor
loot replace entity @s armor.feet loot gm4_armor_identification:mobs/equip_armor/generic
execute if predicate gm4_armor_identification:mobs/modifiers/flowering run item replace entity @s armor.head with flowering_azalea_leaves{gm4_ai_spore:husk}
# set weapon
loot replace entity @s weapon.mainhand loot gm4_armor_identification:mobs/equip_weapon/zombie

# set modifiers
function gm4_armor_identification:mobs/modifiers/prep
