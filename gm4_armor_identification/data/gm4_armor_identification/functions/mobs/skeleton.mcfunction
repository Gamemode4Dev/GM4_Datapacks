# run from mobs/initiate
# @s = skeleton
# at @s

# calculate stats based on difficulty
scoreboard players operation $mob_health gm4_ai_data += $difficulty gm4_ai_data
execute if score $difficulty gm4_ai_data matches 4.. run scoreboard players add $mob_toughness gm4_ai_data 1
execute if score $difficulty gm4_ai_data matches 8.. if predicate gm4_armor_identification:technical/chance_15 run item replace entity @s weapon.offhand with tipped_arrow{tag:{gm4_armor_identification:arrow_skeleton_harming},Potion:"minecraft:harming"}

# biome specific modifiers for this mob
execute if predicate gm4_armor_identification:mobs/modifiers/dark run scoreboard players add $mob_speed gm4_ai_data 2
execute if predicate gm4_armor_identification:mobs/modifiers/toxic run item replace entity @s weapon.offhand with tipped_arrow{tag:{gm4_armor_identification:arrow_skeleton_toxic},display:{Name:'{"translate":"item.minecraft.tipped_arrow.effect.poison","color":"white","italic":false}'},CustomPotionEffects:[{Id:18b,Amplifier:0b,Duration:100},{Id:19b,Amplifier:1b,Duration:100}],CustomPotionColor:5149489}

# set armor
loot replace entity @s armor.feet loot gm4_armor_identification:mobs/equip_armor/generic
# set weapon
loot replace entity @s weapon.mainhand loot gm4_armor_identification:mobs/equip_weapon/skeleton

# modifiy loot table for flowering bone meal and arrow drops
data modify entity @s DeathLootTable set value "gm4_armor_identification:mobs/stray_loot"
data modify entity @s HandDropChances[1] set value -327.670F

# set modifiers
function gm4_armor_identification:mobs/modifiers/prep
