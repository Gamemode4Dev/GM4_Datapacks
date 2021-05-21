#run from active
#@s = player with shamir equipped, sneaking on rails

tag @s add gm4_ml_invehicle

# spawn minecart
summon minecraft:minecart ^ ^.1 ^ {Invulnerable:1b,Tags:["gm4_ml_vehicle"]}

# link player to minecart with id
scoreboard players operation @e[type=minecart,tag=gm4_ml_vehicle,distance=..1,sort=nearest,limit=1] gm4_ml_vecto_id = @s gm4_ml_vecto_id

# start loop for check not in vehicle
schedule function gm4_vecto_shamir:vehicle/check 40t
