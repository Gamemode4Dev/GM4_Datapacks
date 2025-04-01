# dismount other players sitting on this furniture
# @s = player relogging
# at @s
advancement revoke @s only gm4_furniture:relog

tag @s add gm4_furniture_target
scoreboard players set $on_seat gm4_furniture_data 0
execute on vehicle if entity @s[tag=gm4_furniture.seat] run scoreboard players set $on_seat gm4_furniture_data 1
execute if score $on_seat gm4_furniture_data matches 1 align xyz as @a[dx=0,dy=0,dz=0,gamemode=!spectator,tag=!gm4_furniture_target] run ride @s dismount
tag @s remove gm4_furniture_target
