#runs every tick
scoreboard players add gm4_currentTick gm4_clockTick 1
execute if score gm4_currentTick gm4_clockTick matches 16.. run scoreboard players set gm4_currentTick gm4_clockTick 0
function #gm4:pulse_check
function #gm4:repeat

#prints scheduled out-of-date messages to chat
execute if score gm4_currentTick gm4_clockTick matches 0 if entity @a[limit=1,gamemode=creative] if entity @e[limit=1,tag=message,type=area_effect_cloud] run tellraw @a ["",{"text":"The following modules are out of date: ","color":"aqua"},{"selector":"@e[type=area_effect_cloud,tag=message]","color":"gold","insertion":"/tellraw @p %s"}]
execute if score gm4_currentTick gm4_clockTick matches 0 if entity @a[limit=1,gamemode=creative] if entity @e[limit=1,tag=message,type=area_effect_cloud] run kill @e[type=area_effect_cloud,tag=message]

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