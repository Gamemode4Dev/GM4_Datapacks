
data modify storage gm4_combat_expanded:temp update set from storage gm4_combat_expanded:temp sword_ring.data[0]
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:leather_boots"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 65
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:leather_leggings"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 75
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:leather_chestplate"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 80
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:leather_helmet"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 55

execute if data storage gm4_combat_expanded:temp update{id:"minecraft:chainmail_boots"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 195
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:chainmail_leggings"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 225
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:chainmail_chestplate"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 240
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:chainmail_helmet"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 165

execute if data storage gm4_combat_expanded:temp update{id:"minecraft:iron_boots"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 195
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:iron_leggings"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 225
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:iron_chestplate"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 240
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:iron_helmet"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 165

execute if data storage gm4_combat_expanded:temp update{id:"minecraft:golden_boots"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 91
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:golden_leggings"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 105
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:golden_chestplate"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 112
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:golden_helmet"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 77

execute if data storage gm4_combat_expanded:temp update{id:"minecraft:diamond_boots"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 429
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:diamond_leggings"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 495
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:diamond_chestplate"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 528
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:diamond_helmet"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 363

execute if data storage gm4_combat_expanded:temp update{id:"minecraft:netherite_boots"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 481
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:netherite_leggings"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 555
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:netherite_chestplate"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 592
execute if data storage gm4_combat_expanded:temp update{id:"minecraft:netherite_helmet"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 407

execute if data storage gm4_combat_expanded:temp update{id:"minecraft:turtle_helmet"} run data modify storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability set value 275
data remove storage gm4_combat_expanded:temp update

execute store result score $sword_durability gm4_ce_data run data get storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.durability

# TODO: remove this item_modifier
execute if score $sword_id gm4_ce_data matches 0 run item modify entity @p[tag=gm4_ce_target] armor.head gm4_combat_expanded:temp_update_dura
execute if score $sword_id gm4_ce_data matches 1 run item modify entity @p[tag=gm4_ce_target] armor.chest gm4_combat_expanded:temp_update_dura
execute if score $sword_id gm4_ce_data matches 2 run item modify entity @p[tag=gm4_ce_target] armor.legs gm4_combat_expanded:temp_update_dura
execute if score $sword_id gm4_ce_data matches 3 run item modify entity @p[tag=gm4_ce_target] armor.feet gm4_combat_expanded:temp_update_dura
