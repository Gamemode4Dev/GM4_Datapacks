# @s - Phantom beacon entity (in same block as beacon itself)
# run from main

# Kill phantom beacon entity if beacon is broken, and drop a damaged elytra
execute unless block ~ ~ ~ beacon run summon item ~ ~ ~ {Item:{id:"minecraft:elytra",Count:1b,tag:{Damage:432}}}
execute unless block ~ ~ ~ beacon run kill @s

# Teleport phantoms in radius of the beacon to the void
execute if block ~ ~ ~ beacon{Levels:1} positioned ~ ~30 ~ as @e[type=phantom,distance=..30] run tp @s ~ -100 ~
execute if block ~ ~ ~ beacon{Levels:2} positioned ~ ~30 ~ as @e[type=phantom,distance=..45] run tp @s ~ -100 ~
execute if block ~ ~ ~ beacon{Levels:3} positioned ~ ~30 ~ as @e[type=phantom,distance=..60] run tp @s ~ -100 ~
execute if block ~ ~ ~ beacon{Levels:4} positioned ~ ~30 ~ as @e[type=phantom,distance=..75] run tp @s ~ -100 ~