schedule function gm4_furniture:main 8t

# check furniture placements
execute as @e[type=interaction,tag=gm4_furniture.on_wall] at @s if block ^ ^0.5 ^-1 #gm4:replaceable run function gm4_furniture:break/lost_connection
execute as @e[type=interaction,tag=gm4_furniture.on_ceiling] at @s if block ^ ^1.5 ^ #gm4:replaceable run function gm4_furniture:break/lost_connection
# break if wither nearby furniture
execute as @e[type=wither] unless data entity @s NoAI if data entity @s {Invul:0} \
  at @s as @e[type=interaction,tag=gm4_furniture.main,distance=..3] at @s run function gm4_furniture:break/lost_connection
