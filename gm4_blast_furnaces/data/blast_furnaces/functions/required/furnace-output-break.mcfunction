# Called from main.mcfunction

# =============== GIVES THE ITEMS IT TOOK TO CRAFT ON BREAK ====================
execute as @e[tag=gm4_bf_output] at @s if block ~ ~ ~ air run summon item ~ ~ ~ {Motion:[0.0,0.2,0.0],Item:{id:"minecraft:redstone",Count:1b}}
execute as @e[tag=gm4_bf_output] at @s if block ~ ~ ~ air run summon item ~ ~ ~ {Motion:[0.0,0.2,0.0],Item:{id:"minecraft:cobblestone",Count:7b}}
execute as @e[tag=gm4_bf_output] at @s if block ~ ~ ~ air run summon item ~ ~ ~ {Motion:[0.0,0.2,0.0],Item:{id:"minecraft:iron_bars",Count:2b}}
execute as @e[tag=gm4_bf_output] at @s if block ~ ~ ~ air run summon item ~ ~ ~ {Motion:[0.0,0.2,0.0],Item:{id:"minecraft:iron_block",Count:1b}}
execute as @e[tag=gm4_bf_output] at @s if block ~ ~ ~ air run summon item ~ ~ ~ {Motion:[0.0,0.2,0.0],Item:{id:"minecraft:piston",Count:1b}}
execute as @e[tag=gm4_bf_output] at @s if block ~ ~ ~ air run summon item ~ ~ ~ {Motion:[0.0,0.2,0.0],Item:{id:"minecraft:comparator",Count:2b}}
execute as @e[tag=gm4_bf_output] at @s if block ~ ~ ~ air run summon item ~ ~ ~ {Motion:[0.0,0.2,0.0],Item:{id:"minecraft:redstone_torch",Count:1b}}
execute as @e[tag=gm4_bf_output] at @s if block ~ ~ ~ air run summon item ~ ~ ~ {Motion:[0.0,0.2,0.0],Item:{id:"minecraft:crafting_table",Count:1b,tag:{display:{Lore:["slightly damaged workbench"]}}}}
execute as @e[tag=gm4_bf_output] at @s if block ~ ~ ~ air run kill @s