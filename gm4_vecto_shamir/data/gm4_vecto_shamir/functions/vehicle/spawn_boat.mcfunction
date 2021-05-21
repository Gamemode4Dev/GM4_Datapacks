#run from vehicle/check_water and active
#@s = player with shamir equipped, sneaking above water OR ice

tag @s add gm4_ml_invehicle

# spawn boat
summon minecraft:boat ~ ~ ~ {Invulnerable:1b,Tags:["gm4_ml_vehicle"]}
execute rotated as @s run tp @e[type=minecraft:boat,tag=gm4_ml_vehicle,distance=..1,sort=nearest,limit=1] ~ ~ ~ ~ ~

# link player to boat with id
scoreboard players operation @e[type=minecraft:boat,tag=gm4_ml_vehicle,distance=..1,sort=nearest,limit=1] gm4_ml_vecto_id = @s gm4_ml_vecto_id

# start loop for check not in vehicle
schedule function gm4_vecto_shamir:vehicle/check 40t
