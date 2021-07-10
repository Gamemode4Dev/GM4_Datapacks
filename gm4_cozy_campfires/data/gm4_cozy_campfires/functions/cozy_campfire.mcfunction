# @s = gm4_cozy_campfire area_effect_cloud
# run from gm4_cozy_campfires:main

# kill markers without campfire, and branch to players near lit cozy campfires
execute unless block ~ ~ ~ #minecraft:campfires run kill @s
execute if block ~ ~ ~ #minecraft:campfires[lit=true] as @a[distance=..3,gamemode=!spectator] at @s run function gm4_cozy_campfires:cozy_player
