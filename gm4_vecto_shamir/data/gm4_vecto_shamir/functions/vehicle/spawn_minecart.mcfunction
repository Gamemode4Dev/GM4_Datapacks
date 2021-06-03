#run from active
#@s = player with shamir equipped, sneaking on rails

tag @s add gm4_ml_vecto_active

# spawn minecart
summon minecraft:minecart ^ ^.1 ^ {Invulnerable:1b,Tags:["gm4_ml_vecto_vehicle"]}

# link player to minecart with id
scoreboard players operation @e[type=minecraft:minecart,tag=gm4_ml_vecto_vehicle,distance=..1,sort=nearest,limit=1] gm4_ml_vecto_id = @s gm4_ml_vecto_id
