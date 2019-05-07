#@s = firework assemblers with valid recipe format inside

#adding duration
execute if score @s gm4_fa_slot_cnt matches 2 if block ~ ~ ~ minecraft:dropper{Items:[{id:"minecraft:firework_rocket",Slot:0b},{id:"minecraft:gunpowder",Slot:1b}]} unless block ~ ~ ~ minecraft:dropper{Items:[{tag:{Fireworks:{Flight:5b}}}]} run function firework_assemblers:recipes/duration/checks

#patterns
execute if score @s gm4_fa_slot_cnt matches 2 if block ~ ~ ~ minecraft:dropper{Items:[{id:"minecraft:paper",Slot:0b},{id:"minecraft:firework_rocket",Slot:1b,tag:{Fireworks:{Explosions:[{}]}}}]} unless block ~ ~ ~ minecraft:dropper{Items:[{id:"minecraft:paper",tag:{gm4_firework_assemblers:{firework_pattern:1b}}}]} run function firework_assemblers:recipes/pattern/to_pattern/firework_rocket
execute if score @s gm4_fa_slot_cnt matches 2 if block ~ ~ ~ minecraft:dropper{Items:[{id:"minecraft:paper",Slot:0b},{id:"minecraft:firework_star",Slot:1b,tag:{Explosion:{}}}]} unless block ~ ~ ~ minecraft:dropper{Items:[{id:"minecraft:paper",tag:{gm4_firework_assemblers:{firework_pattern:1b}}}]} run function firework_assemblers:recipes/pattern/to_pattern/firework_star

execute if score @s gm4_fa_slot_cnt matches 3 if block ~ ~ ~ minecraft:dropper{Items:[{id:"minecraft:paper",Slot:0b},{id:"minecraft:firework_rocket",Slot:1b,tag:{Fireworks:{Explosions:[{}]}}},{id:"minecraft:water_bucket",Slot:4b}]} unless block ~ ~ ~ minecraft:dropper{Items:[{id:"minecraft:paper",tag:{gm4_firework_assemblers:{firework_pattern:1b}}}]} run function firework_assemblers:recipes/pattern/to_pattern/remove_data/firework_rocket
execute if score @s gm4_fa_slot_cnt matches 3 if block ~ ~ ~ minecraft:dropper{Items:[{id:"minecraft:paper",Slot:0b},{id:"minecraft:firework_star",Slot:1b,tag:{Explosion:{}}},{id:"minecraft:water_bucket",Slot:4b}]} unless block ~ ~ ~ minecraft:dropper{Items:[{id:"minecraft:paper",tag:{gm4_firework_assemblers:{firework_pattern:1b}}}]} run function firework_assemblers:recipes/pattern/to_pattern/remove_data/firework_star

execute if score @s gm4_fa_slot_cnt matches 2 if block ~ ~ ~ minecraft:dropper{Items:[{id:"minecraft:firework_rocket",Slot:0b},{id:"minecraft:paper",Slot:1b,tag:{gm4_firework_assemblers:{firework_pattern:1b}}}]} unless block ~ ~ ~ minecraft:dropper{Items:[{id:"minecraft:firework_rocket",tag:{Fireworks:{Explosions:[]}}}]} run function firework_assemblers:recipes/pattern/to_firework

#setting explosions from stars
execute if score @s gm4_fa_slot_cnt matches 2 if block ~ ~ ~ minecraft:dropper{Items:[{id:"minecraft:firework_rocket",Slot:0b},{id:"minecraft:firework_star",Slot:1b,tag:{Explosion:{}}}]} run function firework_assemblers:recipes/firework_star_to_firework_rocket
