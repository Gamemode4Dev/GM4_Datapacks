# spawn a dungeon based on the biome type.
scoreboard players set #dungeon_success gm4_count 0

# only place a dungeon 12% of the time (0.2 * 0.6)
execute if block ~-2 -63 ~ bedrock run scoreboard players set #dungeon_success gm4_count 1
execute if block ~-2 -61 ~ bedrock run scoreboard players set #dungeon_success gm4_count 1
# make them rarer below Y=0 (because the caves are larger there)
execute if score structure_height gm4_count matches ..0 if block ~-3 -63 ~ bedrock run scoreboard players set #dungeon_success gm4_count 1

execute if score structure_height gm4_count matches 0..50 if score structure_height gm4_count matches 0..50 if predicate gm4_dangerous_dungeons:biome/ocean if block ~ -60 ~5 bedrock store success score #dungeon_success gm4_count run summon item ~ ~ ~ {Tags:["gm4_orbis_structure"],Item:{id:"minecraft:stick",Count:1b,tag:{gm4_orbis:{name:"Ocean Dungeon","structure":{"name":"gm4_dangerous_dungeons:ocean",posX:-8,posY:-7,posZ:-8}}}}}
execute if score structure_height gm4_count matches 0..50 if score structure_height gm4_count matches 0..50 if predicate gm4_dangerous_dungeons:biome/ocean run scoreboard players set #dungeon_success gm4_count 1
execute if score #dungeon_success gm4_count matches 0 if score structure_height gm4_count matches 0..50 if predicate gm4_dangerous_dungeons:biome/desert unless block ~ ~ ~ minecraft:water store success score #dungeon_success gm4_count run summon item ~ ~ ~ {Tags:["gm4_orbis_structure"],Item:{id:"minecraft:stick",Count:1b,tag:{gm4_orbis:{name:"Desert Dungeon","structure":{"name":"gm4_dangerous_dungeons:desert",posX:-8,posY:-7,posZ:-8}}}}}
execute if score #dungeon_success gm4_count matches 0 if score structure_height gm4_count matches 0..50 if predicate gm4_dangerous_dungeons:biome/badlands store success score #dungeon_success gm4_count run summon item ~ ~ ~ {Tags:["gm4_orbis_structure"],Item:{id:"minecraft:stick",Count:1b,tag:{gm4_orbis:{name:"Badlands Dungeon","structure":{"name":"gm4_dangerous_dungeons:badlands",posX:-8,posY:-7,posZ:-8}}}}}
execute if score #dungeon_success gm4_count matches 0 if score structure_height gm4_count matches 0..50 if predicate gm4_dangerous_dungeons:biome/snowy store success score #dungeon_success gm4_count run summon item ~ ~ ~ {Tags:["gm4_orbis_structure"],Item:{id:"minecraft:stick",Count:1b,tag:{gm4_orbis:{name:"Snowy Dungeon","structure":{"name":"gm4_dangerous_dungeons:snowy",posX:-8,posY:-7,posZ:-8}}}}}

execute if score #dungeon_success gm4_count matches 0 if score structure_height gm4_count matches -50..50 run function gm4_dangerous_dungeons:spawn/default
