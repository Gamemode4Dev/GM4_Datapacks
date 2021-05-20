#run from vehicle/check_boat
#@s = player with shamir equipped, sneaking above water

tag @s add gm4_ml_invehicle

# spawn boat
summon minecraft:boat ~ ~ ~ {Invulnerable:1b,Tags:["gm4_ml_vehicle"]}
execute rotated as @p[tag=gm4_ml_invehicle] run tp @e[tag=gm4_ml_vehicle] ~ ~ ~ ~ ~

# link player to boat with id
execute store result score @s gm4_ml_vecto_id run data get entity @s UUID[0]
scoreboard players operation @e[type=boat,tag=gm4_ml_vehicle,distance=..1,sort=nearest,limit=1] gm4_ml_vecto_id = @s gm4_ml_vecto_id

# start loop for check not in vehicle
schedule function gm4_vecto_shamir:vehicle/check 40t
