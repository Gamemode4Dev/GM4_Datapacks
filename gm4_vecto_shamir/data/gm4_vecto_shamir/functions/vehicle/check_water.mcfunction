#run from active
#@s = player with shamir equipped, sneaking above water

# get AEC to where boat would spawn
summon minecraft:area_effect_cloud ~ ~ ~ {Duration:1,Tags:["gm4_ml_vecto_wtr"]}
execute if block ~1 ~-1 ~ #gm4:full_collision run tp @e[tag=gm4_ml_vecto_wtr,distance=..1,sort=nearest,limit=1] ~ ~ ~ 90 0
execute if block ~ ~-1 ~1 #gm4:full_collision run tp @e[tag=gm4_ml_vecto_wtr,distance=..1,sort=nearest,limit=1] ~ ~ ~ 180 0
execute if block ~-1 ~-1 ~ #gm4:full_collision run tp @e[tag=gm4_ml_vecto_wtr,distance=..1,sort=nearest,limit=1] ~ ~ ~ -90 0
execute if block ~ ~-1 ~-1 #gm4:full_collision run tp @e[tag=gm4_ml_vecto_wtr,distance=..1,sort=nearest,limit=1] ~ ~ ~ 0 0
execute as @e[tag=gm4_ml_vecto_wtr,distance=..1,sort=nearest,limit=1] at @s run tp @s ^ ^-.4 ^.7

# check valid spawn area
execute at @e[tag=gm4_ml_vecto_wtr,distance=..1,sort=nearest,limit=1] if block ^ ^ ^1 #gm4:water if block ^.7 ^ ^ #gm4:water if block ^.7 ^ ^1 #gm4:water if block ^-.7 ^ ^ #gm4:water if block ^-.7 ^ ^1 #gm4:water run function gm4_vecto_shamir:vehicle/spawn_boat


