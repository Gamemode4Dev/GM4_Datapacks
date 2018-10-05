# Called from main.mcfunction

# ============== CONTAINS THE CUSTOM CRAFTERS EXTENSION WHERE THE CRAFTING RECIPE IS CHECKED ================
execute as @e[scores={gm4_slot_count=7}] at @s if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:iron_bars",Count:1b},{Slot:1b,id:"minecraft:iron_block",Count:1b},{Slot:2b,id:"minecraft:iron_bars",Count:1b},{Slot:4b,id:"minecraft:piston",Count:1b},{Slot:6b,id:"minecraft:comparator",Count:1b},{Slot:7b,id:"minecraft:redstone_torch",Count:1b},{Slot:8b,id:"minecraft:comparator",Count:1b}]} run setblock ~ ~ ~ hopper{CustomName:"{\"text\":\" Blast Furnace Output\"}"}
execute as @e[scores={gm4_slot_count=7}] at @s if block ~ ~ ~ hopper{CustomName:"{\"text\":\" Blast Furnace Output\"}"} run summon minecraft:armor_stand ~ ~0.2 ~ {NoGravity:1b,Marker:1b,Small:1b,Tags:["gm4_bf_output"],Invisible:1b}
execute as @e[scores={gm4_slot_count=7}] at @s if block ~ ~ ~ hopper{CustomName:"{\"text\":\" Blast Furnace Output\"}"} run playsound minecraft:block.anvil.use block @a[distance=..10] ~ ~ ~ 5 2
execute as @e[scores={gm4_slot_count=7}] at @s if block ~ ~ ~ hopper{CustomName:"{\"text\":\" Blast Furnace Output\"}"} run kill @s