# @s = Audere tool item
# run from #gm4_metallurgy:apply_band

execute store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:netherite_shovel"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 2031
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:netherite_pickaxe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 2031
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:netherite_hoe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 2031
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:netherite_axe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 2031

execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:diamond_shovel"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 1561
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:diamond_pickaxe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 1561
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:diamond_hoe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 1561
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:diamond_axe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 1561

execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_shovel"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 250
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_pickaxe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 250
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_hoe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 250
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_axe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 250

execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:stone_shovel"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 131
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:stone_pickaxe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 131
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:stone_hoe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 131
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:stone_axe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 131

execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:wooden_shovel"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 59
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:wooden_pickaxe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 59
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:wooden_hoe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 59
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:wooden_axe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 59

execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:golden_shovel"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 33
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:golden_pickaxe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 33
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:golden_hoe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 33
execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:golden_axe"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 33

execute unless score $success gm4_ml_data matches 1.. store success score $success gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:shears"}}] run data modify entity @s Item.tag.gm4_audere_shamir.max_durability set value 237

# reset fake player
scoreboard players reset $success gm4_ml_data
