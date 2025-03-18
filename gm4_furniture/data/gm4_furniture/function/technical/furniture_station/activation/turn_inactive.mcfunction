# turn furniture station off if no player is nearby
# @s = furniture station villager
# at @s
# run from technical/furniture_station/activation/process

# lay down tool
execute align xyz run data merge entity @e[type=item_display,tag=gm4_furniture.tool_main,dx=0,dy=0,dz=0,limit=1] {interpolation_duration:5,start_interpolation:-1,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[-1f,0f,0f,1f],translation:[0f,1.125f,0.9375f],scale:[1f,1f,1f]}}

# spawn interaction to turn furniture back on again, has villager data
execute positioned ~ ~1 ~ align xyz run summon interaction ~.5 ~-0.0001 ~.5 {Tags:["gm4_furniture","gm4_furniture.interaction","gm4_furniture.furniture_station","gm4_furniture.reactivate","smithed.entity","smithed.strict","gm4_new_furniture"],height:1.0003f,width:1.0003f,response:1b}
scoreboard players operation @e[type=interaction,tag=gm4_new_furniture,distance=..4,limit=1] gm4_furniture_id = @s gm4_furniture_id
scoreboard players operation @e[type=interaction,tag=gm4_new_furniture,distance=..4,limit=1] gm4_furniture_index = @s gm4_furniture_index
tag @e[type=interaction,tag=gm4_new_furniture,distance=..4] remove gm4_new_furniture

# remove villager
tp @s ~ ~-10000 ~
kill @s
