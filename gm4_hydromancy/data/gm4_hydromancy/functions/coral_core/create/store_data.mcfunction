# put data in item display
# @s = coral flower item display
# at @s
# run from coral_core/create/summon

data merge entity @s {Tags:["gm4_hy_coral_core","gm4_hy_coral_vine.connected"],Rotation:[0F,-90F],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,-0.402f],scale:[0.525f,0.525f,0.001f]},item:{id:"minecraft:heart_of_the_sea",Count:1b}}
data modify entity @s item.tag set from storage gm4_hydromancy:temp tag
