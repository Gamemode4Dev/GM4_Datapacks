# updates old machine armor stands
# @s = ender_hopper armor stand
# located at @s
# run from gm4_ender_hoppers:main

execute if block ~ ~ ~ hopper[facing=down] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_ender_hopper","gm4_machine_marker","smithed.block"],CustomName:'"gm4_ender_hopper"',Rotation:[0.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=down] run data merge entity @s {Tags:["gm4_no_edit","gm4_ender_hopper_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_ender_hopper_stand"',Rotation:[0.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=north] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_ender_hopper","gm4_machine_marker","smithed.block"],CustomName:'"gm4_ender_hopper"',Rotation:[180.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=north] run data merge entity @s {Tags:["gm4_no_edit","gm4_ender_hopper_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_ender_hopper_stand"',Rotation:[180.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=east] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_ender_hopper","gm4_machine_marker","smithed.block"],CustomName:'"gm4_ender_hopper"',Rotation:[-90.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=east] run data merge entity @s {Tags:["gm4_no_edit","gm4_ender_hopper_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_ender_hopper_stand"',Rotation:[-90.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=south] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_ender_hopper","gm4_machine_marker","smithed.block"],CustomName:'"gm4_ender_hopper"',Rotation:[0.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=south] run data merge entity @s {Tags:["gm4_no_edit","gm4_ender_hopper_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_ender_hopper_stand"',Rotation:[0.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=west] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_ender_hopper","gm4_machine_marker","smithed.block"],CustomName:'"gm4_ender_hopper"',Rotation:[90.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=west] run data merge entity @s {Tags:["gm4_no_edit","gm4_ender_hopper_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_ender_hopper_stand"',Rotation:[90.0f,0.0f]}

execute unless block ~ ~ ~ hopper[facing=down] run data modify entity @s HandItems[0].tag.CustomModelData set value 3420008

data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Ender Hopper","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.ender_hopper","font":"gm4:container_gui","color":"white"},{"text":"Ender Hopper","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.ender_hopper","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.ender_hopper","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.ender_hopper","font":"minecraft:default","color":"#373737"}]]}]}'}
scoreboard players set @s gm4_entity_version 1
execute align xyz positioned ~0.5 ~0.5 ~0.5 run scoreboard players set @e[type=marker,tag=gm4_machine_marker,distance=..0.1,limit=1] gm4_entity_version 1
