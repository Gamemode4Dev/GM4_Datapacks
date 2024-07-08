# damage armor durability
# @s = sword item_display
# at player rotated ~x ~
# run from armor/modifier/type/sword_ring/damage_dealt/run

# calculate incoming damage based on unbreaking
execute store result score $unbreaking_level gm4_ae_data run data get storage gm4_armor_expanded:temp sword_ring.data[0].components."minecraft:enchantments".levels."minecraft:unbreaking"
scoreboard players add $unbreaking_level gm4_ae_data 1
scoreboard players set $damage_chance gm4_ae_data 100
scoreboard players operation $damage_chance gm4_ae_data /= $unbreaking_level gm4_ae_data
scoreboard players set $damage_opportunities gm4_ae_data 1
execute store result score $incoming_damage gm4_ae_data run loot spawn 29999998 1 7133 loot gm4_armor_expanded:technical/roll_damage

# if damage should be dealt apply it
execute if score $incoming_damage gm4_ae_data matches 1.. run function gm4_armor_expanded:armor/modifier/type/sword_ring/damage_dealt/apply_durability

# TODO: remove (spigot bug)
execute positioned 29999998 1 7133 run kill @e[type=item,distance=..2]
