#run from vehicle/check_water and active
#@s = player with shamir equipped, sneaking above water OR ice

tag @s add gm4_ml_vecto_active

# spawn boat
execute if entity @s[y_rotation=-45..45] run summon minecraft:boat ~ ~ ~ {Invulnerable:1b,Tags:["gm4_ml_vecto_vehicle"],Rotation:[0f,0f]}
execute if entity @s[y_rotation=45..135] run summon minecraft:boat ~ ~ ~ {Invulnerable:1b,Tags:["gm4_ml_vecto_vehicle"],Rotation:[90f,0f]}
execute if entity @s[y_rotation=135..225] run summon minecraft:boat ~ ~ ~ {Invulnerable:1b,Tags:["gm4_ml_vecto_vehicle"],Rotation:[180f,0f]}
execute if entity @s[y_rotation=-135..-45] run summon minecraft:boat ~ ~ ~ {Invulnerable:1b,Tags:["gm4_ml_vecto_vehicle"],Rotation:[270f,0f]}

# link player to boat with id
scoreboard players operation @e[type=minecraft:boat,tag=gm4_ml_vecto_vehicle,distance=..1,sort=nearest,limit=1] gm4_ml_vecto_id = @s gm4_ml_vecto_id
