# Called from handle_block_structure.mcfunction
# @s = with valid furnace


tag @s remove gm4_bf_has_structure

# Checking the structure
execute if block ~-1 ~ ~-1 minecraft:iron_block if block ~-1 ~ ~1 minecraft:iron_block if block ~1 ~ ~-1 minecraft:iron_block if block ~1 ~ ~1 minecraft:iron_block if block ~-1 ~1 ~-1 minecraft:iron_block if block ~-1 ~1 ~1 minecraft:iron_block if block ~1 ~1 ~-1 minecraft:iron_block if block ~1 ~1 ~1 minecraft:iron_block if block ^1 ^ ^ minecraft:iron_block if block ^-1 ^ ^ minecraft:iron_block if block ^ ^ ^-1 minecraft:iron_block if block ^1 ^1 ^ minecraft:iron_block if block ^-1 ^1 ^ minecraft:iron_block if block ^ ^1 ^-1 minecraft:iron_block run tag @s add gm4_bf_has_structure


# Handle the advancements
execute if entity @s[tag=gm4_bf_has_structure] run advancement grant @a[distance=..8,scores={gm4_bf_placed_iron=1..}] only gm4:blast_furnaces build_blast_furnace
execute if entity @s[tag=gm4_bf_has_structure] run advancement grant @a[distance=..8,scores={gm4_bf_placed_furn=1..}] only gm4:blast_furnaces build_blast_furnace

# Check recipes
execute if entity @s[tag=gm4_bf_has_structure] positioned ^ ^ ^1 run function blast_furnaces:check_recipes
