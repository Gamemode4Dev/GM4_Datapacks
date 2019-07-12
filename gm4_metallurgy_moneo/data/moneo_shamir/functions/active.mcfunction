#run from main
#@s = players holding a moneo tool

scoreboard players set tool_current_damage gm4_ml_data 0
execute store result score tool_current_damage gm4_ml_data run data get entity @s SelectedItem.tag.Damage

execute if entity @s[nbt={SelectedItem:{id:"minecraft:wooden_shovel"}}] run function moneo_shamir:tools/materials/wood
execute if entity @s[nbt={SelectedItem:{id:"minecraft:wooden_pickaxe"}}] run function moneo_shamir:tools/materials/wood
execute if entity @s[nbt={SelectedItem:{id:"minecraft:wooden_hoe"}}] run function moneo_shamir:tools/materials/wood
execute if entity @s[nbt={SelectedItem:{id:"minecraft:wooden_axe"}}] run function moneo_shamir:tools/materials/wood

execute if entity @s[nbt={SelectedItem:{id:"minecraft:stone_shovel"}}] run function moneo_shamir:tools/materials/stone
execute if entity @s[nbt={SelectedItem:{id:"minecraft:stone_pickaxe"}}] run function moneo_shamir:tools/materials/stone
execute if entity @s[nbt={SelectedItem:{id:"minecraft:stone_hoe"}}] run function moneo_shamir:tools/materials/stone
execute if entity @s[nbt={SelectedItem:{id:"minecraft:stone_axe"}}] run function moneo_shamir:tools/materials/stone

execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_shovel"}}] run function moneo_shamir:tools/materials/iron
execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_pickaxe"}}] run function moneo_shamir:tools/materials/iron
execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_hoe"}}] run function moneo_shamir:tools/materials/iron
execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_axe"}}] run function moneo_shamir:tools/materials/iron

execute if entity @s[nbt={SelectedItem:{id:"minecraft:diamond_shovel"}}] run function moneo_shamir:tools/materials/diamond
execute if entity @s[nbt={SelectedItem:{id:"minecraft:diamond_pickaxe"}}] run function moneo_shamir:tools/materials/diamond
execute if entity @s[nbt={SelectedItem:{id:"minecraft:diamond_hoe"}}] run function moneo_shamir:tools/materials/diamond
execute if entity @s[nbt={SelectedItem:{id:"minecraft:diamond_axe"}}] run function moneo_shamir:tools/materials/diamond

execute if entity @s[nbt={SelectedItem:{id:"minecraft:shears"}}] run function moneo_shamir:tools/shears