# init seat with data and make player ride it
# @s = furniture's seat item_display entity
# at @s
# run from interact/sit/spawn_seat

data merge entity @s {Tags:["gm4_furniture","gm4_furniture.seat","smithed.entity","smithed.strict"],item:{id:"air",count:1},item_display:head,Rotation:[0.0f,0.0f],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]}}
ride @p[tag=gm4_furniture_target] mount @s
