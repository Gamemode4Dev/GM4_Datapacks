# run from mobs/initiate
# @s = stray
# at @s

# calculate stats based on difficulty
scoreboard players operation $mob_health gm4_ai_data += $difficulty gm4_ai_data
execute if score $difficulty gm4_ai_data matches 4.. run scoreboard players add $mob_toughness gm4_ai_data 1
execute if score $difficulty gm4_ai_data matches 8.. if predicate gm4_armor_identification:technical/chance_15 run item replace entity @s weapon.offhand with tipped_arrow{tag:{gm4_armor_identification:arrow_stray_harming},CustomPotionEffects:[{Id:2b,Amplifier:0b,Duration:600}],Potion:"minecraft:harming"}

# double armor drop rate at diff 11 or above
execute if score $difficulty gm4_ai_data matches 11.. run data modify entity @s ArmorDropChances set value [0.17F,0.17F,0.17F,0.17F]

# biome specific modifiers for this mob
execute if predicate gm4_armor_identification:mobs/modifiers/dark run scoreboard players add $mob_speed gm4_ai_data 2
execute if predicate gm4_armor_identification:mobs/modifiers/snowy unless predicate gm4_armor_identification:mobs/modifiers/growth run item replace entity @s weapon.offhand with tipped_arrow{tag:{gm4_armor_identification:arrow_stray_snowy},display:{Name:'{"translate":"item.minecraft.tipped_arrow.effect.slowness","color":"white","italic":false}'},CustomPotionEffects:[{Id:2b,Amplifier:2b,Duration:600}],CustomPotionColor:5926017}
execute if predicate gm4_armor_identification:mobs/modifiers/toxic run item replace entity @s weapon.offhand with tipped_arrow{tag:{gm4_armor_identification:arrow_stray_toxic},display:{Name:'{"translate":"item.minecraft.tipped_arrow.effect.poison","color":"white","italic":false}'},CustomPotionEffects:[{Id:18b,Amplifier:0b,Duration:100},{Id:19b,Amplifier:1b,Duration:100},{Id:2b,Amplifier:0b,Duration:600}],CustomPotionColor:5149489}
execute if predicate gm4_armor_identification:mobs/modifiers/growth run item replace entity @s weapon.mainhand with air

# set armor
loot replace entity @s armor.feet loot gm4_armor_identification:mobs/equip_armor/generic
# set weapon
loot replace entity @s weapon.mainhand loot gm4_armor_identification:mobs/equip_weapon/skeleton

# modifiy loot table for flowering bone meal and arrow drops
data modify entity @s DeathLootTable set value "gm4_armor_identification:mobs/stray_loot"
data modify entity @s HandDropChances[1] set value -327.670F

# set modifiers
function gm4_armor_identification:mobs/modifiers/prep
