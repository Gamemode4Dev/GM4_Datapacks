# @s - beacon core entity (in same block as beacon itself)
# run from main

# Kill beacon core entity if beacon is broken, and drop core(s)
execute unless block ~ ~ ~ beacon if entity @s[tag=gm4_beacon_phantom] run summon item ~ ~ ~ {Item:{id:"minecraft:phantom_membrane",Count:1b,tag:{gm4_beacon_cores:{custom_core:1b},Enchantments:[{id:"",lvl:1}],display:{Name:"{\"text\":\"Phantom Core\",\"italic\":\"false\",\"color\":\"yellow\"}"}}}}

execute unless block ~ ~ ~ beacon if entity @s[tag=gm4_beacon_zombie] run summon item ~ ~ ~ {Item:{id:"minecraft:rotten_flesh",Count:1b,tag:{gm4_beacon_cores:{custom_core:1b,type:2},Enchantments:[{id:"",lvl:1}],display:{Name:"{\"text\":\"Zombie Core\",\"italic\":\"false\",\"color\":\"yellow\"}"}}}}

execute unless block ~ ~ ~ beacon if entity @s[tag=gm4_beacon_skeleton] run summon item ~ ~ ~ {Item:{id:"minecraft:bone",Count:1b,tag:{gm4_beacon_cores:{custom_core:1b,type:2},Enchantments:[{id:"",lvl:1}],display:{Name:"{\"text\":\"Skeleton Core\",\"italic\":\"false\",\"color\":\"yellow\"}"}}}}

execute unless block ~ ~ ~ beacon if entity @s[tag=gm4_beacon_creeper] run summon item ~ ~ ~ {Item:{id:"minecraft:gunpowder",Count:1b,tag:{gm4_beacon_cores:{custom_core:1b},Enchantments:[{id:"",lvl:1}],display:{Name:"{\"text\":\"Creeper Core\",\"italic\":\"false\",\"color\":\"yellow\"}"}}}}

execute unless block ~ ~ ~ beacon if entity @s[tag=gm4_beacon_enderman] run summon item ~ ~ ~ {Item:{id:"minecraft:ender_pearl",Count:1b,tag:{gm4_beacon_cores:{custom_core:1b},Enchantments:[{id:"",lvl:1}],display:{Name:"{\"text\":\"Enderman Core\",\"italic\":\"false\",\"color\":\"yellow\"}"}}}}

execute unless block ~ ~ ~ beacon if entity @s[tag=gm4_beacon_spider] run summon item ~ ~ ~ {Item:{id:"minecraft:spider_eye",Count:1b,tag:{gm4_beacon_cores:{custom_core:1b},Enchantments:[{id:"",lvl:1}],display:{Name:"{\"text\":\"Spider Core\",\"italic\":\"false\",\"color\":\"yellow\"}"}}}}

execute unless block ~ ~ ~ beacon run kill @s

# Damage hostile mobs every 3 seconds
scoreboard players add @s gm4_beacon_fire 1
execute if entity @s[scores={gm4_beacon_fire=3..}] run function beacon_cores:fire_beacons

# Particles to identify a beacon core
execute at @s run particle witch ~ ~1 ~ 0.1 0.1 0.1 0.05 3

# Test whether or not the beacon is full and apply a tag if so
tag @s remove gm4_beacon_full
execute if entity @s[scores={gm4_beacon_cores=1..}] if block ~ ~ ~ beacon{Levels:1} run tag @s add gm4_beacon_full
execute if entity @s[scores={gm4_beacon_cores=2..}] if block ~ ~ ~ beacon{Levels:2} run tag @s add gm4_beacon_full
execute if entity @s[scores={gm4_beacon_cores=4..}] if block ~ ~ ~ beacon{Levels:3} run tag @s add gm4_beacon_full
execute if entity @s[scores={gm4_beacon_cores=6..}] if block ~ ~ ~ beacon{Levels:4} run tag @s add gm4_beacon_full
execute if entity @s[tag=gm4_beacon_full] run title @a[distance=..2.5] actionbar {"text":"This beacon can't hold any more cores!","color":"red"}

# Break beacon if beacon levels are messed with (to prevent exploiting)
execute if entity @s[scores={gm4_beacon_cores=2..}] if block ~ ~ ~ beacon{Levels:1} run setblock ~ ~ ~ air destroy
execute if entity @s[scores={gm4_beacon_cores=3..}] if block ~ ~ ~ beacon{Levels:2} run setblock ~ ~ ~ air destroy
execute if entity @s[scores={gm4_beacon_cores=5..}] if block ~ ~ ~ beacon{Levels:3} run setblock ~ ~ ~ air destroy