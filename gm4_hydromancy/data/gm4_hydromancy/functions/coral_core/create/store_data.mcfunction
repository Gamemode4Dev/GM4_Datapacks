# put data in item display
# @s = coral core item display
# at @s
# run from coral_core/create/summon

data merge entity @s {Tags:["gm4_hy_coral_core","gm4_hy_coral_vine.connected"],Rotation:[0F,-90F],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,-0.402f],scale:[0.525f,0.525f,0.001f]},item:{id:"minecraft:heart_of_the_sea",Count:1b}}
data modify entity @s item.tag set from storage gm4_hydromancy:temp tag

# charge circle
execute store result score @s gm4_hy_charge run data get storage gm4_hydromancy:temp tag.gm4_hydromancy.stored_mana
scoreboard players set $circle_steps gm4_hy_data 20
execute at @s rotated ~-9 ~ run function gm4_hydromancy:coral_core/charge/display
tag @s add gm4_hy_target
execute align xyz as @e[type=block_display,tag=gm4_hy_coral_core.charge_display,dx=0,dy=0,dz=0] at @s run tp @s ~ ~.1 ~ facing entity @e[type=item_display,tag=gm4_hy_target,limit=1]
tag @s remove gm4_hy_target
