schedule function gm4_furniture:main 8t

# check furniture placements
execute as @e[type=interaction,tag=gm4_furniture.on_wall] at @s if block ^ ^0.5 ^-1 #gm4:replaceable run function gm4_furniture:break/lost_connection
execute as @e[type=interaction,tag=gm4_furniture.on_ceiling] at @s if block ^ ^1.5 ^ #gm4:replaceable run function gm4_furniture:break/lost_connection
# break if wither nearby furniture
execute as @e[type=wither] unless data entity @s NoAI if data entity @s {Invul:0} \
  at @s as @e[type=interaction,tag=gm4_furniture.main,distance=..3] at @s run function gm4_furniture:break/lost_connection
# break if non-furniture block inside furniture
execute as @e[type=interaction,tag=gm4_furniture.interaction] at @s unless block ~ ~0.1 ~ #gm4_furniture:furniture_blocks run function gm4_furniture:break/destroy_find_main
# particles
execute as @e[type=marker,tag=gm4_furniture.particle_marker] at @s run function gm4_furniture:particle/process
# campfire
execute if score gm4_cozy_camfires load.status matches 1.. as @e[type=marker,tag=gm4_furniture.particle.campfire_smoke] at @s as @a[distance=..3,gamemode=!spectator] at @s run function gm4_cozy_campfires:cozy_player
