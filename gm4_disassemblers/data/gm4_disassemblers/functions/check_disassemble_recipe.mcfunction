# Called from target_item
# @s = item to check

tag @s add gm4_disassembled
scoreboard players set result_items gm4_disassembler -1
execute store result score damage gm4_disassembler run data get entity @s Item.tag.Damage

execute if entity @s[nbt={Item:{id:"minecraft:leather_helmet"}}] run function gm4_disassemblers:items/leather_helmet
execute if entity @s[nbt={Item:{id:"minecraft:leather_chestplate"}}] run function gm4_disassemblers:items/leather_chestplate
execute if entity @s[nbt={Item:{id:"minecraft:leather_leggings"}}] run function gm4_disassemblers:items/leather_leggings
execute if entity @s[nbt={Item:{id:"minecraft:leather_boots"}}] run function gm4_disassemblers:items/leather_boots
execute if entity @s[nbt={Item:{id:"minecraft:iron_axe"}}] run function gm4_disassemblers:items/iron_axe
execute if entity @s[nbt={Item:{id:"minecraft:golden_sword"}}] run function gm4_disassemblers:items/golden_sword
execute if entity @s[nbt={Item:{id:"minecraft:golden_hoe"}}] run function gm4_disassemblers:items/golden_hoe
execute if entity @s[nbt={Item:{id:"minecraft:iron_sword"}}] run function gm4_disassemblers:items/iron_sword
execute if entity @s[nbt={Item:{id:"minecraft:golden_pickaxe"}}] run function gm4_disassemblers:items/golden_pickaxe
execute if entity @s[nbt={Item:{id:"minecraft:golden_shovel"}}] run function gm4_disassemblers:items/golden_shovel
execute if entity @s[nbt={Item:{id:"minecraft:golden_axe"}}] run function gm4_disassemblers:items/golden_axe
execute if entity @s[nbt={Item:{id:"minecraft:golden_chestplate"}}] run function gm4_disassemblers:items/golden_chestplate
execute if entity @s[nbt={Item:{id:"minecraft:golden_leggings"}}] run function gm4_disassemblers:items/golden_leggings
execute if entity @s[nbt={Item:{id:"minecraft:golden_boots"}}] run function gm4_disassemblers:items/golden_boots
execute if entity @s[nbt={Item:{id:"minecraft:golden_helmet"}}] run function gm4_disassemblers:items/golden_helmet
execute if entity @s[nbt={Item:{id:"minecraft:iron_helmet"}}] run function gm4_disassemblers:items/iron_helmet
execute if entity @s[nbt={Item:{id:"minecraft:iron_leggings"}}] run function gm4_disassemblers:items/iron_leggings
execute if entity @s[nbt={Item:{id:"minecraft:iron_boots"}}] run function gm4_disassemblers:items/iron_boots
execute if entity @s[nbt={Item:{id:"minecraft:iron_chestplate"}}] run function gm4_disassemblers:items/iron_chestplate
execute if entity @s[nbt={Item:{id:"minecraft:iron_pickaxe"}}] run function gm4_disassemblers:items/iron_pickaxe
execute if entity @s[nbt={Item:{id:"minecraft:iron_shovel"}}] run function gm4_disassemblers:items/iron_shovel
execute if entity @s[nbt={Item:{id:"minecraft:iron_hoe"}}] run function gm4_disassemblers:items/iron_hoe
execute if entity @s[nbt={Item:{id:"minecraft:shears"}}] run function gm4_disassemblers:items/shears
execute if entity @s[nbt={Item:{id:"minecraft:flint_and_steel"}}] run function gm4_disassemblers:items/flint_and_steel

execute if score result_items gm4_disassembler matches 0 run playsound minecraft:entity.dragon_fireball.explode master @a[distance=..5] ~ ~ ~ .33 1.5
execute if score result_items gm4_disassembler matches 1.. run playsound minecraft:entity.firework_rocket.large_blast master @a[distance=..5] ~ ~ ~ 1.5 1.1
particle minecraft:firework ~ ~.75 ~ .1 0 .1 .15 6 force

execute if score result_items gm4_disassembler matches 0.. run kill @s
