# @s - beacon core entity (in same block as beacon itself)
# run from beacon.mcfunction

# Only damages mobs if the beacon is active (Levels > 0)
# Depending on the beacon Level, the area of effect is increased
# Does not damage named mobs (only damages mobs with the default name of the entity)
execute if entity @s[tag=gm4_beacon_phantom] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=phantom,dx=33,dy=33,dz=33,name="Phantom"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_phantom] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=phantom,dx=65,dy=65,dz=65,name="Phantom"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_phantom] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=phantom,dx=129,dy=129,dz=129,name="Phantom"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_phantom] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=phantom,dx=201,dy=201,dz=201,name="Phantom"] run effect give @s instant_health 1 0 true

execute if entity @s[tag=gm4_beacon_spider] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=spider,dx=33,dy=33,dz=33,name="Spider"] run effect give @s instant_damage 1 0 true
execute if entity @s[tag=gm4_beacon_spider] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=spider,dx=65,dy=65,dz=65,name="Spider"] run effect give @s instant_damage 1 0 true
execute if entity @s[tag=gm4_beacon_spider] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=spider,dx=129,dy=129,dz=129,name="Spider"] run effect give @s instant_damage 1 0 true
execute if entity @s[tag=gm4_beacon_spider] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=spider,dx=201,dy=201,dz=201,name="Spider"] run effect give @s instant_damage 1 0 true

execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=stray,dx=33,dy=33,dz=33,name="Stray"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=stray,dx=65,dy=65,dz=65,name="Stray"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=stray,dx=129,dy=129,dz=129,name="Stray"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=stray,dx=201,dy=201,dz=201,name="Stray"] run effect give @s instant_health 1 0 true

execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=husk,dx=33,dy=33,dz=33,name="Husk"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=husk,dx=65,dy=65,dz=65,name="Husk"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=husk,dx=129,dy=129,dz=129,name="Husk"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=husk,dx=201,dy=201,dz=201,name="Husk"] run effect give @s instant_health 1 0 true

execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=husk,dx=33,dy=33,dz=33,name=""] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=husk,dx=65,dy=65,dz=65,name="Husk"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=husk,dx=129,dy=129,dz=129,name="Husk"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=husk,dx=201,dy=201,dz=201,name="Husk"] run effect give @s instant_health 1 0 true

execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=zombie_pigman,dx=33,dy=33,dz=33,name="Zombie Pigman"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=zombie_pigman,dx=65,dy=65,dz=65,name="Zombie Pigman"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=zombie_pigman,dx=129,dy=129,dz=129,name="Zombie Pigman"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=zombie_pigman,dx=201,dy=201,dz=201,name="Zombie Pigman"] run effect give @s instant_health 1 0 true

execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=skeleton,dx=33,dy=33,dz=33,name="Skeleton"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=skeleton,dx=65,dy=65,dz=65,name="Skeleton"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=skeleton,dx=129,dy=129,dz=129,name="Skeleton"] run effect give @s instant_health 1 0 true
execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=skeleton,dx=201,dy=201,dz=201,name="Skeleton"] run effect give @s instant_health 1 0 true

execute if entity @s[tag=gm4_beacon_creeper] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=creeper,dx=33,dy=33,dz=33,name="Creeper"] run effect give @s instant_damage 1 0 true
execute if entity @s[tag=gm4_beacon_creeper] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=creeper,dx=65,dy=65,dz=65,name="Creeper"] run effect give @s instant_damage 1 0 true
execute if entity @s[tag=gm4_beacon_creeper] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=creeper,dx=129,dy=129,dz=129,name="Creeper"] run effect give @s instant_damage 1 0 true
execute if entity @s[tag=gm4_beacon_creeper] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=creeper,dx=201,dy=201,dz=201,name="Creeper"] run effect give @s instant_damage 1 0 true

execute if entity @s[tag=gm4_beacon_enderman] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=enderman,dx=33,dy=33,dz=33,name="Enderman"] run effect give @s instant_damage 1 0 true
execute if entity @s[tag=gm4_beacon_enderman] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=enderman,dx=65,dy=65,dz=65,name="Enderman"] run effect give @s instant_damage 1 0 true
execute if entity @s[tag=gm4_beacon_enderman] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=enderman,dx=129,dy=129,dz=129,name="Enderman"] run effect give @s instant_damage 1 0 true
execute if entity @s[tag=gm4_beacon_enderman] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=enderman,dx=201,dy=201,dz=201,name="Enderman"] run effect give @s instant_damage 1 0 true

# Gives mobs the loot table to not drop loot
execute if entity @s[tag=gm4_beacon_phantom] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=phantom,dx=33,dy=33,dz=33,name="Phantom"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_phantom] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=phantom,dx=65,dy=65,dz=65,name="Phantom"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_phantom] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=phantom,dx=129,dy=129,dz=129,name="Phantom"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_phantom] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=phantom,dx=201,dy=201,dz=201,name="Phantom"] run data merge entity @s {DeathLootTable:"minecraft:empty"}

execute if entity @s[tag=gm4_beacon_spider] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=spider,dx=33,dy=33,dz=33,name="Spider"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_spider] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=spider,dx=65,dy=65,dz=65,name="Spider"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_spider] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=spider,dx=129,dy=129,dz=129,name="Spider"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_spider] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=spider,dx=201,dy=201,dz=201,name="Spider"] run data merge entity @s {DeathLootTable:"minecraft:empty"}

execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=stray,dx=33,dy=33,dz=33,name="Stray"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=stray,dx=65,dy=65,dz=65,name="Stray"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=stray,dx=129,dy=129,dz=129,name="Stray"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=stray,dx=201,dy=201,dz=201,name="Stray"] run data merge entity @s {DeathLootTable:"minecraft:empty"}

execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=husk,dx=33,dy=33,dz=33,name="Husk"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=husk,dx=65,dy=65,dz=65,name="Husk"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=husk,dx=129,dy=129,dz=129,name="Husk"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=husk,dx=201,dy=201,dz=201,name="Husk"] run data merge entity @s {DeathLootTable:"minecraft:empty"}

execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=zombie,dx=33,dy=33,dz=33,name="Zombie"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=zombie,dx=65,dy=65,dz=65,name="Zombie"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=zombie,dx=129,dy=129,dz=129,name="Zombie"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=zombie,dx=201,dy=201,dz=201,name="Zombie"] run data merge entity @s {DeathLootTable:"minecraft:empty"}

execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=skeleton,dx=33,dy=33,dz=33,name="Skeleton"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=skeleton,dx=65,dy=65,dz=65,name="Skeleton"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=skeleton,dx=129,dy=129,dz=129,name="Skeleton"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_skeleton] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=skeleton,dx=201,dy=201,dz=201,name="Skeleton"] run data merge entity @s {DeathLootTable:"minecraft:empty"}

execute if entity @s[tag=gm4_beacon_creeper] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=creeper,dx=33,dy=33,dz=33,name="Creeper"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_creeper] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=creeper,dx=65,dy=65,dz=65,name="Creeper"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_creeper] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=creeper,dx=129,dy=129,dz=129,name="Creeper"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_creeper] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=creeper,dx=201,dy=201,dz=201,name="Creeper"] run data merge entity @s {DeathLootTable:"minecraft:empty"}

execute if entity @s[tag=gm4_beacon_enderman] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=enderman,dx=33,dy=33,dz=33,name="Enderman"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_enderman] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=enderman,dx=65,dy=65,dz=65,name="Enderman"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_enderman] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=enderman,dx=129,dy=129,dz=129,name="Enderman"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_enderman] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=enderman,dx=201,dy=201,dz=201,name="Enderman"] run data merge entity @s {DeathLootTable:"minecraft:empty"}

execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:1} positioned ~-17 ~-17 ~-17 as @e[type=zombie_pigman,dx=33,dy=33,dz=33,name="Zombie Pigman"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:2} positioned ~-33 ~-33 ~-33 as @e[type=zombie_pigman,dx=65,dy=65,dz=65,name="Zombie Pigman"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:3} positioned ~-65 ~-65 ~-65 as @e[type=zombie_pigman,dx=129,dy=129,dz=129,name="Zombie Pigman"] run data merge entity @s {DeathLootTable:"minecraft:empty"}
execute if entity @s[tag=gm4_beacon_zombie] if block ~ ~ ~ beacon{Levels:4} positioned ~-101 ~-101 ~-101 as @e[type=zombie_pigman,dx=201,dy=201,dz=201,name="Zombie Pigman"] run data merge entity @s {DeathLootTable:"minecraft:empty"}

# Reset clock
scoreboard players set @s gm4_beacon_fire 0
tp @s ~ ~ ~ ~45 ~