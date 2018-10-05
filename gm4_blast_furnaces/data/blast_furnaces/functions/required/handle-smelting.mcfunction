# Called from main.mcfunction

# =========== SUMMON ARMOR STAND WHEN IRON OR GOLD IS SMELTING ==========
execute as @e[tag=gm4_bf_has_structure] at @s[tag=!gm4_bf_is_smelting] if block ~ ~ ~1 furnace{Items:[{Slot:0b,id:"minecraft:iron_ore"}]} run summon armor_stand ~ ~-0.2 ~ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Small:1b,ArmorItems:[{},{},{},{id:"iron_ore",Count:1b}],HandItems:[{},{}],DisabledSlots:2039583,Tags:["gm4_bf_ore"]}
execute as @e[tag=gm4_bf_has_structure] at @s[tag=!gm4_bf_is_smelting] if block ~ ~ ~1 furnace{Items:[{Slot:0b,id:"minecraft:gold_ore"}]} run summon armor_stand ~ ~-0.2 ~ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Small:1b,ArmorItems:[{},{},{},{id:"gold_ore",Count:1b}],HandItems:[{},{}],DisabledSlots:2039583,Tags:["gm4_bf_ore"]}
execute as @e[tag=gm4_bf_has_structure] at @s[tag=!gm4_bf_is_smelting] if block ~ ~ ~-1 furnace{Items:[{Slot:0b,id:"minecraft:iron_ore"}]} run summon armor_stand ~ ~-0.2 ~ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Small:1b,ArmorItems:[{},{},{},{id:"iron_ore",Count:1b}],HandItems:[{},{}],DisabledSlots:2039583,Tags:["gm4_bf_ore"]}
execute as @e[tag=gm4_bf_has_structure] at @s[tag=!gm4_bf_is_smelting] if block ~ ~ ~-1 furnace{Items:[{Slot:0b,id:"minecraft:gold_ore"}]} run summon armor_stand ~ ~-0.2 ~ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Small:1b,ArmorItems:[{},{},{},{id:"gold_ore",Count:1b}],HandItems:[{},{}],DisabledSlots:2039583,Tags:["gm4_bf_ore"]}
execute as @e[tag=gm4_bf_has_structure] at @s[tag=!gm4_bf_is_smelting] if block ~1 ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:iron_ore"}]} run summon armor_stand ~ ~-0.2 ~ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Small:1b,ArmorItems:[{},{},{},{id:"iron_ore",Count:1b}],HandItems:[{},{}],DisabledSlots:2039583,Tags:["gm4_bf_ore"]}
execute as @e[tag=gm4_bf_has_structure] at @s[tag=!gm4_bf_is_smelting] if block ~1 ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:gold_ore"}]} run summon armor_stand ~ ~-0.2 ~ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Small:1b,ArmorItems:[{},{},{},{id:"gold_ore",Count:1b}],HandItems:[{},{}],DisabledSlots:2039583,Tags:["gm4_bf_ore"]}
execute as @e[tag=gm4_bf_has_structure] at @s[tag=!gm4_bf_is_smelting] if block ~-1 ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:iron_ore"}]} run summon armor_stand ~ ~-0.2 ~ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Small:1b,ArmorItems:[{},{},{},{id:"iron_ore",Count:1b}],HandItems:[{},{}],DisabledSlots:2039583,Tags:["gm4_bf_ore"]}
execute as @e[tag=gm4_bf_has_structure] at @s[tag=!gm4_bf_is_smelting] if block ~-1 ~ ~ furnace{Items:[{Slot:0b,id:"minecraft:gold_ore"}]} run summon armor_stand ~ ~-0.2 ~ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Small:1b,ArmorItems:[{},{},{},{id:"gold_ore",Count:1b}],HandItems:[{},{}],DisabledSlots:2039583,Tags:["gm4_bf_ore"]}
execute at @e[tag=gm4_bf_ore] as @e[distance=..2,tag=gm4_bf_output] run tag @s add gm4_bf_is_smelting

# ============ KILL THE ARMOR STAND WHEN THERE IS NO ORE =================
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