# spawn a coral flower
# @s = heart of the sea item on a coral fan
# at @s
# run from coral_flower/create/check_item

execute align xyz run summon item_display ~.5 ~.5 ~.5 {Tags:["gm4_hy_coral_flower"],Rotation:[0F,-90F],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,-0.402f],scale:[0.525f,0.525f,0.001f]},item:{id:"minecraft:heart_of_the_sea",Count:1b}}
kill @s
