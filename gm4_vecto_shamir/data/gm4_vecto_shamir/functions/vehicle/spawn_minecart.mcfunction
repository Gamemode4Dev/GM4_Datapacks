# @s = player with shamir equipped, sneaking on rails
# at @s
# run from active

tag @s add gm4_vecto_active

# spawn minecart
summon minecraft:minecart ^ ^.1 ^ {Invulnerable:1b,Tags:["gm4_vecto_vehicle","gm4_vecto_new_vehicle"]}
team join gm4_vecto_nocoll @e[type=minecraft:minecart,tag=gm4_vecto_new_vehicle,distance=..1,sort=nearest,limit=1]

# link player to minecart with id
scoreboard players operation @e[type=minecraft:minecart,tag=gm4_vecto_new_vehicle,distance=..1,sort=nearest,limit=1] gm4_vecto_id = @s gm4_vecto_id

# effects
playsound minecraft:block.metal.place neutral @a[distance=..15] ~ ~ ~ 1 2
