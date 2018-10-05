# Called from main.mcfunction

# ============== CONTAINS THE CUSTOM CRAFTERS EXTENSION WHERE THE CRAFTING RECIPE IS CHECKED ================
setblock ~ ~ ~ hopper{CustomName:"{\"text\":\" Blast Furnace Output\"}"}
summon minecraft:armor_stand ~ ~0.2 ~ {NoGravity:1b,Marker:1b,Small:1b,Tags:["gm4_bf_output"],Invisible:1b}
playsound minecraft:block.anvil.use block @a[distance=..10] ~ ~ ~ 5 2
kill @s
