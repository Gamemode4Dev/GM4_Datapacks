#@s = valid ore ready to grow
#rans from ore_trees:run/valid_sapling

#stops ore item from despawning
data merge entity @s {Age:1s}

#adds to the ores timer
scoreboard players add @s gm4_ortr_time 1

#tests for overworld ore type and displays particle above
execute if entity @s[nbt={Item:{id:"minecraft:gold_ore"}}] align xyz positioned ~0.5 ~2 ~0.5 run particle block gold_ore ~ ~ ~ 0.25 0 0.25 0 2 normal @a[distance=..8]
execute if entity @s[nbt={Item:{id:"minecraft:iron_ore"}}] align xyz positioned ~0.5 ~2 ~0.5 run particle block iron_ore ~ ~ ~ 0.25 0 0.25 0 2 normal @a[distance=..8]
execute if entity @s[nbt={Item:{id:"minecraft:coal_ore"}}] align xyz positioned ~0.5 ~2 ~0.5 run particle block coal_ore ~ ~ ~ 0.25 0 0.25 0 2 normal @a[distance=..8]
execute if entity @s[nbt={Item:{id:"minecraft:lapis_ore"}}] align xyz positioned ~0.5 ~2 ~0.5 run particle block lapis_ore ~ ~ ~ 0.25 0 0.25 0 2 normal @a[distance=..8]
execute if entity @s[nbt={Item:{id:"minecraft:diamond_ore"}}] align xyz positioned ~0.5 ~2 ~0.5 run particle block diamond_ore ~ ~ ~ 0.25 0 0.25 0 2 normal @a[distance=..8]
execute if entity @s[nbt={Item:{id:"minecraft:redstone_ore"}}] align xyz positioned ~0.5 ~2 ~0.5 run particle block redstone_ore ~ ~ ~ 0.25 0 0.25 0 2 normal @a[distance=..8]
execute if entity @s[nbt={Item:{id:"minecraft:emerald_ore"}}] align xyz positioned ~0.5 ~2 ~0.5 run particle block emerald_ore ~ ~ ~ 0.25 0 0.25 0 2 normal @a[distance=..8]
#tests for overworld ore type and displays particle above
execute if entity @s[nbt={Item:{id:"minecraft:nether_quartz_ore"}}] align xyz positioned ~0.5 ~2 ~0.5 run particle block nether_quartz_ore ~ ~ ~ 0.25 0 0.25 0 2 normal @a[distance=..8]

#tests for a growth time of 20 minutes
execute if score @s gm4_ortr_time matches 1500.. align xyz positioned ~0.5 ~0.5 ~0.5 run function ore_trees:run/get_tree