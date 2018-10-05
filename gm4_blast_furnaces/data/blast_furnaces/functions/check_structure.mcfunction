tag @s remove gm4_bf_has_structure
# =========== CHECKING FOR THE BLAST FURNACE STRUCTURE ===================
execute if block ~-1 ~ ~-1 minecraft:iron_block if block ~-1 ~ ~1 minecraft:iron_block if block ~1 ~ ~-1 minecraft:iron_block if block ~1 ~ ~1 minecraft:iron_block if block ~-1 ~1 ~-1 minecraft:iron_block if block ~-1 ~1 ~1 minecraft:iron_block if block ~1 ~1 ~-1 minecraft:iron_block if block ~1 ~1 ~1 minecraft:iron_block if block ^1 ^ ^ minecraft:iron_block if block ^-1 ^ ^ minecraft:iron_block if block ^ ^ ^-1 minecraft:iron_block if block ^1 ^1 ^ minecraft:iron_block if block ^-1 ^1 ^ minecraft:iron_block if block ^ ^1 ^-1 minecraft:iron_block run tag @s add gm4_bf_has_structure



# =============== HANDLES ADVANCEMENT GRANTING ===========================
execute at @e[tag=gm4_bf_has_structure] as @p[distance=..8,scores={gm4_bf_placed=1..}] run advancement grant @s only gm4:blast_furnaces
scoreboard players reset @a[scores={gm4_bf_placed=1..}] gm4_bf_placed
execute at @e[tag=gm4_bf_has_structure] as @p[distance=..8,scores={gm4_bf_placedf=1..}] run advancement grant @s only gm4:blast_furnaces
scoreboard players reset @a[scores={gm4_bf_placedf=1..}] gm4_bf_placedf
