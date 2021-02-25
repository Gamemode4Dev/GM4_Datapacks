# @s = item above disassembler
# Called from #check_recipe

tag @s add gm4_disassembled
scoreboard players set result_items gm4_disassembler -1
execute store result score damage gm4_disassembler run data get entity @s Item.tag.Damage

data modify storage gm4_disassemblers:temp/item Item set from entity @s Item

execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:golden_sword"} run function gm4_disassemblers:items/golden_sword
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:golden_hoe"} run function gm4_disassemblers:items/golden_hoe
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:golden_pickaxe"} run function gm4_disassemblers:items/golden_pickaxe
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:golden_shovel"} run function gm4_disassemblers:items/golden_shovel
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:golden_axe"} run function gm4_disassemblers:items/golden_axe
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:golden_chestplate"} run function gm4_disassemblers:items/golden_chestplate
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:golden_leggings"} run function gm4_disassemblers:items/golden_leggings
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:golden_boots"} run function gm4_disassemblers:items/golden_boots
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:golden_helmet"} run function gm4_disassemblers:items/golden_helmet
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:iron_axe"} run function gm4_disassemblers:items/iron_axe
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:iron_sword"} run function gm4_disassemblers:items/iron_sword
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:iron_helmet"} run function gm4_disassemblers:items/iron_helmet
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:iron_leggings"} run function gm4_disassemblers:items/iron_leggings
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:iron_boots"} run function gm4_disassemblers:items/iron_boots
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:iron_chestplate"} run function gm4_disassemblers:items/iron_chestplate
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:iron_pickaxe"} run function gm4_disassemblers:items/iron_pickaxe
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:iron_shovel"} run function gm4_disassemblers:items/iron_shovel
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:iron_hoe"} run function gm4_disassemblers:items/iron_hoe
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:shears"} run function gm4_disassemblers:items/shears
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:flint_and_steel"} run function gm4_disassemblers:items/flint_and_steel
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:leather_helmet"} run function gm4_disassemblers:items/leather_helmet
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:leather_chestplate"} run function gm4_disassemblers:items/leather_chestplate
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:leather_leggings"} run function gm4_disassemblers:items/leather_leggings
execute if data storage gm4_disassemblers:temp/item Item{id:"minecraft:leather_boots"} run function gm4_disassemblers:items/leather_boots

data remove storage gm4_disassemblers:temp/item Item

execute if score result_items gm4_disassembler matches 0 run playsound minecraft:entity.dragon_fireball.explode block @a[distance=..5] ~ ~ ~ .33 1.5
execute if score result_items gm4_disassembler matches 1.. run playsound minecraft:entity.firework_rocket.large_blast block @a[distance=..5] ~ ~ ~ 0.66 1.1
particle minecraft:smoke ~ ~1 ~ .1 0 .1 .03 8 force

execute if score result_items gm4_disassembler matches 0.. run kill @s
