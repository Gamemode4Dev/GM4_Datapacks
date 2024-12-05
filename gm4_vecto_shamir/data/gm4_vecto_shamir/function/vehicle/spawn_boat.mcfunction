# @s = player with shamir equipped, sneaking above water OR ice
# at @s
# run from active and vehicle/check_boat_collision

tag @s add gm4_vecto_active

# spawn boat
execute if entity @s[y_rotation=-45..45] run function gm4_vecto_shamir:vehicle/spawn_boat_south
execute if entity @s[y_rotation=45..135] run function gm4_vecto_shamir:vehicle/spawn_boat_west
execute if entity @s[y_rotation=135..225] run function gm4_vecto_shamir:vehicle/spawn_boat_north
execute if entity @s[y_rotation=-135..-45] run function gm4_vecto_shamir:vehicle/spawn_boat_east

team join gm4_vecto_nocoll @e[type=#minecraft:boat,tag=gm4_vecto_new_vehicle,distance=..1,sort=nearest,limit=1]

# link player to boat with id
scoreboard players operation @e[type=#minecraft:boat,tag=gm4_vecto_new_vehicle,distance=..1,sort=nearest,limit=1] gm4_vecto_id = @s gm4_vecto_id

# remove new tag
tag @e[type=#minecraft:boat,tag=gm4_vecto_new_vehicle,distance=..1,sort=nearest,limit=1] remove gm4_vecto_new_vehicle

# effects
execute if block ~ ~-1 ~ #minecraft:ice run playsound minecraft:entity.boat.paddle_land player @a[distance=..15] ~ ~ ~ 2 1
execute unless block ~ ~-1 ~ #minecraft:ice run playsound minecraft:entity.boat.paddle_water player @a[distance=..15] ~ ~ ~ 2 1
