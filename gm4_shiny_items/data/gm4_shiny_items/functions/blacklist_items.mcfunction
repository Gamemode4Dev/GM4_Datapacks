# Run from Main
# @s = All items within 30 blocks of a player

# TO BE CHANGED
execute if entity @s[tag=!gm4_shiny_blacklist] unless entity @s[nbt={Item:{Count:1b}}] run tag @s add gm4_shiny_blacklist

### ITEMS THAT COULD CAUSE PROBLEMS ###
# Could cause player to get item with tag "unstackable:1b"
execute if entity @s[tag=!gm4_shiny_blacklist] if block ~ ~-.6 ~ hopper run tag @s add gm4_shiny_blacklist

### ITEMS THAT ALREADY HAVE ENCHANTMENT GLOW ###
# Enchanted Items
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{tag:{Enchantments:[{}]}}}] run tag @s add gm4_shiny_blacklist
# Misc (1)
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:enchanted_book"}}] run tag @s add gm4_shiny_blacklist
# Bottles (4)
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:potion"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:splash_potion"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:lingering_potion"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:experience_bottle"}}] run tag @s add gm4_shiny_blacklist

### ITEMS THAT CAN BE ENCHANTED ALREADY ###
# Misc (8)
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:flint_and_steel"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:shears"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:fishing_rod"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:bow"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:crossbow"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:trident"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:shield"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:carrot_on_a_stick"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_apple"}}] run tag @s add gm4_shiny_blacklist
# Swords (5)
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:wooden_sword"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:stone_sword"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_sword"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_sword"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_sword"}}] run tag @s add gm4_shiny_blacklist
# Axes (5)
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:wooden_axe"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:stone_axe"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_axe"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_axe"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_axe"}}] run tag @s add gm4_shiny_blacklist
# Pickaxes (5)
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:wooden_pickaxe"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:stone_pickaxe"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_pickaxe"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_pickaxe"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_pickaxe"}}] run tag @s add gm4_shiny_blacklist
# Shovel (5)
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:wooden_shovel"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:stone_shovel"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_shovel"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_shovel"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_shovel"}}] run tag @s add gm4_shiny_blacklist
# Hoes (5)
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:wooden_hoe"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:stone_hoe"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_hoe"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_hoe"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_hoe"}}] run tag @s add gm4_shiny_blacklist
# Helmets (6)
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:turtle_helmet"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:leather_helmet"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:chainmail_helmet"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_helmet"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_helmet"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_helmet"}}] run tag @s add gm4_shiny_blacklist
# Chestplates (5)
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:elytra"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:leather_chestplate"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_chestplate"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:chainmail_chestplate"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_chestplate"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_chestplate"}}] run tag @s add gm4_shiny_blacklist
# Leggings (5)
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:leather_leggings"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:chainmail_leggings"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_leggings"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_leggings"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_leggings"}}] run tag @s add gm4_shiny_blacklist
# Boots (5)
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:leather_boots"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:chainmail_boots"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_boots"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_boots"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_boots"}}] run tag @s add gm4_shiny_blacklist

### ITEMS THAT CANT GET THE ENCHANTMENT GLOW ###
# Shulker Boxes
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:white_shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:orange_shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:magenta_shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:light_blue_shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:yellow_shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:lime_shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:pink_shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:gray_shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:light_gray_shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:cyan_shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:purple_shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:blue_shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:brown_shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:green_shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:red_shulker_box"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:black_shulker_box"}}] run tag @s add gm4_shiny_blacklist
# Beds
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:white_bed"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:orange_bed"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:magenta_bed"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:light_blue_bed"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:yellow_bed"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:lime_bed"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:pink_bed"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:gray_bed"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:light_gray_bed"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:cyan_bed"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:purple_bed"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:blue_bed"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:brown_bed"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:green_bed"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:red_bed"}}] run tag @s add gm4_shiny_blacklist
execute if entity @s[tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:black_bed"}}] run tag @s add gm4_shiny_blacklist