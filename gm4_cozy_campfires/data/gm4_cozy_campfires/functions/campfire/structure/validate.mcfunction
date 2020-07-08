# @s = gm4_cozy_campfire area_effect_cloud
# at @s
# run from gm4_cozy_campfires:main

# kill area_effect_clouds without campfire, and branch to players near lit cozy campfires
execute unless block ~ ~ ~ #minecraft:campfires run kill @s
execute if block ~ ~ ~ #minecraft:campfires[lit=true] as @a[distance=..12,gamemode=!spectator] at @s run function gm4_cozy_campfires:player/near_cozy_campfire
