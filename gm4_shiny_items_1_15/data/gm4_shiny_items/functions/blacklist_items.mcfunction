#run from main

#@s = At all players

execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist] unless entity @s[nbt={Item:{Count:1b}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{tag:{Enchantments:[{lvl:1s}]}}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{tag:{Enchantments:[{lvl:2s}]}}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{tag:{Enchantments:[{lvl:3s}]}}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{tag:{Enchantments:[{lvl:4s}]}}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{tag:{Enchantments:[{lvl:5s}]}}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist] if block ~ ~-.6 ~ hopper run tag @s add gm4_shiny_blacklist

execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:enchanted_book"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:potion"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:splash_potion"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:lingering_potion"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:experience_bottle"}}] run tag @s add gm4_shiny_blacklist

execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:wooden_sword"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:wooden_axe"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:wooden_pickaxe"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:wooden_shovel"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:wooden_hoe"}}] run tag @s add gm4_shiny_blacklist

execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:stone_sword"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:stone_axe"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:stone_pickaxe"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:stone_shovel"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:stone_hoe"}}] run tag @s add gm4_shiny_blacklist

execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_sword"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_axe"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_pickaxe"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_shovel"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_hoe"}}] run tag @s add gm4_shiny_blacklist

execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_sword"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_axe"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_pickaxe"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_shovel"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_hoe"}}] run tag @s add gm4_shiny_blacklist

execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_sword"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_axe"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_pickaxe"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_shovel"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_hoe"}}] run tag @s add gm4_shiny_blacklist

execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:flint_and_steel"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:shears"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:fishing_rod"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:bow"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:crossbow"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:trident"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:shield"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:carrot_on_a_stick"}}] run tag @s add gm4_shiny_blacklist

execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:leather_helmet"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:leather_chestplate"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:leather_leggings"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:leather_boots"}}] run tag @s add gm4_shiny_blacklist

execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:chainmail_helmet"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:chainmail_chestplate"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:chainmail_leggings"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:chainmail_boots"}}] run tag @s add gm4_shiny_blacklist

execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_helmet"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_chestplate"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_leggings"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:iron_boots"}}] run tag @s add gm4_shiny_blacklist

execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_helmet"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_chestplate"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_leggings"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:diamond_boots"}}] run tag @s add gm4_shiny_blacklist

execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_helmet"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_chestplate"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_leggings"}}] run tag @s add gm4_shiny_blacklist
execute as @e[type=item,distance=..30,tag=!gm4_shiny_blacklist,nbt={Item:{id:"minecraft:golden_boots"}}] run tag @s add gm4_shiny_blacklist