# Called from main.mcfunction

# Find furnace
execute if entity @s[tag=!gm4_bf_has_furnace] run say Ok

# =========== CHECKING FOR THE BLAST FURNACE STRUCTURE ===================
execute as @e[tag=gm4_bf_output] at @s[tag=!gm4_bf_has_structure] if block ~-1 ~ ~ minecraft:furnace if block ~-1 ~1 ~ minecraft:glass if block ~-1 ~ ~1 minecraft:iron_block if block ~ ~ ~1 minecraft:iron_block if block ~1 ~ ~1 minecraft:iron_block if block ~1 ~ ~ minecraft:iron_block if block ~1 ~ ~-1 minecraft:iron_block if block ~ ~ ~-1 minecraft:iron_block if block ~-1 ~ ~-1 minecraft:iron_block if block ~-1 ~1 ~1 minecraft:iron_block if block ~ ~1 ~1 minecraft:iron_block if block ~1 ~1 ~1 minecraft:iron_block if block ~1 ~1 ~ minecraft:iron_block if block ~1 ~1 ~-1 minecraft:iron_block if block ~ ~1 ~-1 minecraft:iron_block if block ~-1 ~1 ~-1 minecraft:iron_block run tag @s add gm4_bf_has_structure
execute as @e[tag=gm4_bf_output] at @s[tag=!gm4_bf_has_structure] if block ~ ~ ~1 minecraft:furnace if block ~ ~1 ~1 minecraft:glass if block ~-1 ~ ~1 minecraft:iron_block if block ~-1 ~ ~ minecraft:iron_block if block ~1 ~ ~1 minecraft:iron_block if block ~1 ~ ~ minecraft:iron_block if block ~1 ~ ~-1 minecraft:iron_block if block ~ ~ ~-1 minecraft:iron_block if block ~-1 ~ ~-1 minecraft:iron_block if block ~-1 ~1 ~1 minecraft:iron_block if block ~1 ~1 ~1 minecraft:iron_block if block ~1 ~1 ~ minecraft:iron_block if block ~1 ~1 ~-1 minecraft:iron_block if block ~ ~1 ~-1 minecraft:iron_block if block ~-1 ~1 ~ minecraft:iron_block if block ~-1 ~1 ~-1 minecraft:iron_block run tag @s add gm4_bf_has_structure
execute as @e[tag=gm4_bf_output] at @s[tag=!gm4_bf_has_structure] if block ~1 ~ ~ minecraft:furnace if block ~1 ~1 ~ minecraft:glass if block ~-1 ~ ~1 minecraft:iron_block if block ~ ~ ~1 minecraft:iron_block if block ~1 ~ ~1 minecraft:iron_block if block ~-1 ~ ~ minecraft:iron_block if block ~1 ~ ~-1 minecraft:iron_block if block ~ ~ ~-1 minecraft:iron_block if block ~-1 ~ ~-1 minecraft:iron_block if block ~-1 ~1 ~1 minecraft:iron_block if block ~ ~1 ~1 minecraft:iron_block if block ~1 ~1 ~1 minecraft:iron_block if block ~1 ~1 ~-1 minecraft:iron_block if block ~ ~1 ~-1 minecraft:iron_block if block ~-1 ~1 ~ minecraft:iron_block if block ~-1 ~1 ~-1 minecraft:iron_block run tag @s add gm4_bf_has_structure
execute as @e[tag=gm4_bf_output] at @s[tag=!gm4_bf_has_structure] if block ~ ~ ~-1 minecraft:furnace if block ~ ~1 ~-1 minecraft:glass if block ~-1 ~ ~1 minecraft:iron_block if block ~ ~ ~1 minecraft:iron_block if block ~1 ~ ~1 minecraft:iron_block if block ~1 ~ ~ minecraft:iron_block if block ~1 ~ ~-1 minecraft:iron_block if block ~-1 ~ ~ minecraft:iron_block if block ~-1 ~ ~-1 minecraft:iron_block if block ~-1 ~1 ~1 minecraft:iron_block if block ~ ~1 ~1 minecraft:iron_block if block ~1 ~1 ~1 minecraft:iron_block if block ~1 ~1 ~ minecraft:iron_block if block ~1 ~1 ~-1 minecraft:iron_block if block ~-1 ~1 ~ minecraft:iron_block if block ~-1 ~1 ~-1 minecraft:iron_block run tag @s add gm4_bf_has_structure

# =============== HANDLES ADVANCEMENT GRANTING ===========================
execute at @e[tag=gm4_bf_has_structure] as @p[distance=..8,scores={gm4_bf_placed=1..}] run advancement grant @s only gm4:blast_furnaces
scoreboard players reset @a[scores={gm4_bf_placed=1..}] gm4_bf_placed
execute at @e[tag=gm4_bf_has_structure] as @p[distance=..8,scores={gm4_bf_placedg=1..}] run advancement grant @s only gm4:blast_furnaces
scoreboard players reset @a[scores={gm4_bf_placedg=1..}] gm4_bf_placedg
execute at @e[tag=gm4_bf_has_structure] as @p[distance=..8,scores={gm4_bf_placedf=1..}] run advancement grant @s only gm4:blast_furnaces
scoreboard players reset @a[scores={gm4_bf_placedf=1..}] gm4_bf_placedf

# ======== CHECK FOR ALL FACINGS OF THE FURNACE SPECIFICALLY =============
execute as @e[tag=gm4_bf_has_structure] at @s unless block ~-1 ~ ~ minecraft:iron_block unless block ~-1 ~ ~ minecraft:furnace run tag @s remove gm4_bf_has_structure
execute as @e[tag=gm4_bf_has_structure] at @s unless block ~ ~ ~1 minecraft:iron_block unless block ~ ~ ~1 minecraft:furnace run tag @s remove gm4_bf_has_structure
execute as @e[tag=gm4_bf_has_structure] at @s unless block ~1 ~ ~ minecraft:iron_block unless block ~1 ~ ~ minecraft:furnace run tag @s remove gm4_bf_has_structure
execute as @e[tag=gm4_bf_has_structure] at @s unless block ~ ~ ~-1 minecraft:iron_block unless block ~ ~ ~-1 minecraft:furnace run tag @s remove gm4_bf_has_structure

execute as @e[tag=gm4_bf_has_structure] at @s unless block ~-1 ~1 ~ minecraft:iron_block unless block ~-1 ~1 ~ minecraft:glass run tag @s remove gm4_bf_has_structure
execute as @e[tag=gm4_bf_has_structure] at @s unless block ~ ~1 ~1 minecraft:iron_block unless block ~ ~1 ~1 minecraft:glass run tag @s remove gm4_bf_has_structure
execute as @e[tag=gm4_bf_has_structure] at @s unless block ~1 ~1 ~ minecraft:iron_block unless block ~1 ~1 ~ minecraft:glass run tag @s remove gm4_bf_has_structure
execute as @e[tag=gm4_bf_has_structure] at @s unless block ~ ~1 ~-1 minecraft:iron_block unless block ~ ~1 ~-1 minecraft:glass run tag @s remove gm4_bf_has_structure

# ======= REMOVING THE TAG IF A BLOCK IS MISSING FROM STRUCTURE ==========
# ========== (CHECKING CORNERS OF STRUCTURE SPECIFICALLY) ================
execute as @e[tag=gm4_bf_has_structure] at @s unless block ~-1 ~ ~1 minecraft:iron_block run tag @s remove gm4_bf_has_structure
execute as @e[tag=gm4_bf_has_structure] at @s unless block ~1 ~ ~1 minecraft:iron_block run tag @s remove gm4_bf_has_structure
execute as @e[tag=gm4_bf_has_structure] at @s unless block ~1 ~ ~-1 minecraft:iron_block run tag @s remove gm4_bf_has_structure
execute as @e[tag=gm4_bf_has_structure] at @s unless block ~-1 ~ ~-1 minecraft:iron_block run tag @s remove gm4_bf_has_structure
execute as @e[tag=gm4_bf_has_structure] at @s unless block ~-1 ~1 ~1 minecraft:iron_block run tag @s remove gm4_bf_has_structure
execute as @e[tag=gm4_bf_has_structure] at @s unless block ~1 ~1 ~1 minecraft:iron_block run tag @s remove gm4_bf_has_structure
execute as @e[tag=gm4_bf_has_structure] at @s unless block ~1 ~1 ~-1 minecraft:iron_block run tag @s remove gm4_bf_has_structure
execute as @e[tag=gm4_bf_has_structure] at @s unless block ~-1 ~1 ~-1 minecraft:iron_block run tag @s remove gm4_bf_has_structure
