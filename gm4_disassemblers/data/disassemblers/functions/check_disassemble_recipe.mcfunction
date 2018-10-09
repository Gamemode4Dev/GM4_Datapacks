# Called from target_item
# @s = item to check

tag @s add gm4_disassembled
scoreboard players set result_items gm4_disassembler -1
execute store result score damage gm4_disassembler run data get entity @s Item.tag.Damage

execute if entity @s[nbt={Item:{id:"minecraft:diamond_chestplate"}}] run function disassemblers:items/diamond_chestplate
execute if entity @s[nbt={Item:{id:"minecraft:diamond_sword"}}] run function disassemblers:items/diamond_sword
execute if entity @s[nbt={Item:{id:"minecraft:diamond_pickaxe"}}] run function disassemblers:items/diamond_pickaxe
execute if entity @s[nbt={Item:{id:"minecraft:diamond_shovel"}}] run function disassemblers:items/diamond_shovel
execute if entity @s[nbt={Item:{id:"minecraft:diamond_axe"}}] run function disassemblers:items/diamond_axe
execute if entity @s[nbt={Item:{id:"minecraft:diamond_leggings"}}] run function disassemblers:items/diamond_leggings
execute if entity @s[nbt={Item:{id:"minecraft:diamond_boots"}}] run function disassemblers:items/diamond_boots
execute if entity @s[nbt={Item:{id:"minecraft:diamond_helmet"}}] run function disassemblers:items/diamond_helmet
execute if entity @s[nbt={Item:{id:"minecraft:leather_helmet"}}] run function disassemblers:items/leather_helmet
execute if entity @s[nbt={Item:{id:"minecraft:leather_chestplate"}}] run function disassemblers:items/leather_chestplate
execute if entity @s[nbt={Item:{id:"minecraft:leather_leggings"}}] run function disassemblers:items/leather_leggings
execute if entity @s[nbt={Item:{id:"minecraft:leather_boots"}}] run function disassemblers:items/leather_boots
execute if entity @s[nbt={Item:{id:"minecraft:iron_axe"}}] run function disassemblers:items/iron_axe
execute if entity @s[nbt={Item:{id:"minecraft:golden_sword"}}] run function disassemblers:items/golden_sword
execute if entity @s[nbt={Item:{id:"minecraft:golden_hoe"}}] run function disassemblers:items/golden_hoe
execute if entity @s[nbt={Item:{id:"minecraft:diamond_hoe"}}] run function disassemblers:items/diamond_hoe
execute if entity @s[nbt={Item:{id:"minecraft:iron_sword"}}] run function disassemblers:items/iron_sword
execute if entity @s[nbt={Item:{id:"minecraft:golden_pickaxe"}}] run function disassemblers:items/golden_pickaxe
execute if entity @s[nbt={Item:{id:"minecraft:golden_shovel"}}] run function disassemblers:items/golden_shovel
execute if entity @s[nbt={Item:{id:"minecraft:golden_axe"}}] run function disassemblers:items/golden_axe
execute if entity @s[nbt={Item:{id:"minecraft:golden_chestplate"}}] run function disassemblers:items/golden_chestplate
execute if entity @s[nbt={Item:{id:"minecraft:golden_leggings"}}] run function disassemblers:items/golden_leggings
execute if entity @s[nbt={Item:{id:"minecraft:golden_boots"}}] run function disassemblers:items/golden_boots
execute if entity @s[nbt={Item:{id:"minecraft:golden_helmet"}}] run function disassemblers:items/golden_helmet
execute if entity @s[nbt={Item:{id:"minecraft:iron_helmet"}}] run function disassemblers:items/iron_helmet
execute if entity @s[nbt={Item:{id:"minecraft:iron_leggings"}}] run function disassemblers:items/iron_leggings
execute if entity @s[nbt={Item:{id:"minecraft:iron_boots"}}] run function disassemblers:items/iron_boots
execute if entity @s[nbt={Item:{id:"minecraft:iron_chestplate"}}] run function disassemblers:items/iron_chestplate
execute if entity @s[nbt={Item:{id:"minecraft:iron_pickaxe"}}] run function disassemblers:items/iron_pickaxe
execute if entity @s[nbt={Item:{id:"minecraft:iron_shovel"}}] run function disassemblers:items/iron_shovel
execute if entity @s[nbt={Item:{id:"minecraft:iron_hoe"}}] run function disassemblers:items/iron_hoe

execute if score result_items gm4_disassembler matches 0 run playsound minecraft:block.anvil.place master @a[distance=..5] ~ ~ ~ 3 0
execute if score result_items gm4_disassembler matches 1.. run playsound minecraft:block.anvil.use master @a[distance=..5] ~ ~ ~ 3 2
execute if score result_items gm4_disassembler matches 0.. run kill @s
