#run from find_stone
#@s = cobblestone items with age of 0

execute if entity @s[y_rotation=0..20] run summon item ~ ~ ~ {Item:{id:"minecraft:redstone",Count:1},Motion:[0.0d,0.1d,0.0d]}
execute if entity @s[y_rotation=21..50] run summon item ~ ~ ~ {Item:{id:"minecraft:gold_nugget",Count:1},Motion:[0.0d,0.1d,0.0d]}
execute if entity @s[y_rotation=51..90] run summon item ~ ~ ~ {Item:{id:"minecraft:iron_nugget",Count:1},Motion:[0.0d,0.1d,0.0d]}

#0-20 redstone
#21-50 gold nugget
#51-90 iron nugget

#Potential future additions for drops:
#emeralds in extreme hills
#metallurgy ores

#1.14 notes: Convert to Block Loot Table
