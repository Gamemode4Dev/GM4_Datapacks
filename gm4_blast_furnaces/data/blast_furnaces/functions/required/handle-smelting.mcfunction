# Called from main.mcfunction

# =========== ADD ORE WHEN IRON OR GOLD IS SMELTING ==========
execute as @e[tag=gm4_bf_has_structure] at @s[tag=!gm4_bf_is_smelting] if block ^ ^ ^1 furnace{Items:[{Slot:0b,id:"minecraft:iron_ore"}]} run data merge entity @s {ArmorItems:[{},{},{},{id:"iron_ore",Count:1b}],DisabledSlots:2039583}
execute as @e[tag=gm4_bf_has_structure] at @s[tag=!gm4_bf_is_smelting] if block ^ ^ ^1 furnace{Items:[{Slot:0b,id:"minecraft:gold_ore"}]} run data merge entity @s {ArmorItems:[{},{},{},{id:"gold_ore",Count:1b}],DisabledSlots:2039583}
execute at @e[tag=gm4_bf_ore] as @e[distance=..2,tag=gm4_bf_output] run tag @s add gm4_bf_is_smelting

# ============ REMOVE ORE IF THERE IS NO ORE =================
execute as @e[tag=gm4_bf_has_structure] at @s[tag=gm4_bf_is_smelting] unless block ~ ~ ~1 furnace{Items:[{Slot:0b}]} if block ~ ~ ~1 furnace run kill @e[distance=..2,tag=gm4_bf_ore]
execute as @e[tag=gm4_bf_has_structure] at @s[tag=gm4_bf_is_smelting] unless block ~ ~ ~1 furnace{Items:[{Slot:0b}]} if block ~ ~ ~1 furnace run tag @s remove gm4_bf_is_smelting
execute as @e[tag=gm4_bf_has_structure] at @s[tag=gm4_bf_is_smelting] unless block ~ ~ ~-1 furnace{Items:[{Slot:0b}]} if block ~ ~ ~-1 furnace run kill @e[distance=..2,tag=gm4_bf_ore]
execute as @e[tag=gm4_bf_has_structure] at @s[tag=gm4_bf_is_smelting] unless block ~ ~ ~-1 furnace{Items:[{Slot:0b}]} if block ~ ~ ~-1 furnace run tag @s remove gm4_bf_is_smelting
execute as @e[tag=gm4_bf_has_structure] at @s[tag=gm4_bf_is_smelting] unless block ~1 ~ ~ furnace{Items:[{Slot:0b}]} if block ~1 ~ ~ furnace run kill @e[distance=..2,tag=gm4_bf_ore]
execute as @e[tag=gm4_bf_has_structure] at @s[tag=gm4_bf_is_smelting] unless block ~1 ~ ~ furnace{Items:[{Slot:0b}]} if block ~1 ~ ~ furnace run tag @s remove gm4_bf_is_smelting
execute as @e[tag=gm4_bf_has_structure] at @s[tag=gm4_bf_is_smelting] unless block ~-1 ~ ~ furnace{Items:[{Slot:0b}]} if block ~-1 ~ ~ furnace run kill @e[distance=..2,tag=gm4_bf_ore]
execute as @e[tag=gm4_bf_has_structure] at @s[tag=gm4_bf_is_smelting] unless block ~-1 ~ ~ furnace{Items:[{Slot:0b}]} if block ~-1 ~ ~ furnace run tag @s remove gm4_bf_is_smelting

# ========== CANCEL THE BLAST FURNACE SMELTING PROCESS IF STRUCTURE IS BROKEN =============
execute as @e[tag=gm4_bf_output,tag=!gm4_bf_has_structure] at @s[tag=gm4_bf_is_smelting] run kill @e[distance=..1,tag=gm4_bf_ore,limit=1]
execute as @e[tag=gm4_bf_output,tag=!gm4_bf_has_structure] unless entity @e[distance=..1,tag=gm4_bf_ore] run tag @s remove gm4_bf_is_smelting
