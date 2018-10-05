# ======================== BLAST FURNACE STUFF ======================================

# =============== DOUBLE THE ORE OUTPUT ON TICK TO ENSURE ABUSE PROOFING =======================
execute as @e[tag=gm4_bf_is_smelting] at @s if block ~ ~ ~1 furnace{Items:[{Slot:0b,id:"minecraft:iron_ore"}],CookTime:190s} run summon item ~ ~1 ~ {Item:{id:"minecraft:iron_ingot",Count:1b}}
execute as @e[tag=gm4_bf_is_smelting] at @s if block ~ ~ ~-1 furnace{Items:[{Slot:0b,id:"minecraft:iron_ore"}],CookTime:190s} run summon item ~ ~1 ~ {Item:{id:"minecraft:iron_ingot",Count:1b}}
execute as @e[tag=gm4_bf_is_smelting] at @s if block ~1 ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:iron_ore"}],CookTime:190s} run summon item ~ ~1 ~ {Item:{id:"minecraft:iron_ingot",Count:1b}}
execute as @e[tag=gm4_bf_is_smelting] at @s if block ~-1 ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:iron_ore"}],CookTime:190s} run summon item ~ ~1 ~ {Item:{id:"minecraft:iron_ingot",Count:1b}}

execute as @e[tag=gm4_bf_is_smelting] at @s if block ~ ~ ~1 furnace{Items:[{Slot:0b,id:"minecraft:gold_ore"}],CookTime:190s} run summon item ~ ~1 ~ {Item:{id:"minecraft:gold_ingot",Count:1b}}
execute as @e[tag=gm4_bf_is_smelting] at @s if block ~ ~ ~-1 furnace{Items:[{Slot:0b,id:"minecraft:gold_ore"}],CookTime:190s} run summon item ~ ~1 ~ {Item:{id:"minecraft:gold_ingot",Count:1b}}
execute as @e[tag=gm4_bf_is_smelting] at @s if block ~1 ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:gold_ore"}],CookTime:190s} run summon item ~ ~1 ~ {Item:{id:"minecraft:gold_ingot",Count:1b}}
execute as @e[tag=gm4_bf_is_smelting] at @s if block ~-1 ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:gold_ore"}],CookTime:190s} run summon item ~ ~1 ~ {Item:{id:"minecraft:gold_ingot",Count:1b}}
