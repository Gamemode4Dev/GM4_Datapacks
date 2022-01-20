# updates old machine cart armor stands
# @s = ender_hoppers_display armor stand
# located at @s
# run from gm4_ender_hoppers:main

data merge entity @s {Tags:["gm4_no_edit","gm4_ender_hopper_stand","gm4_machine_cart","smithed.entity","smithed.strict"],CustomName:'"gm4_ender_hopper_stand"',Pose:{Head:[180f,0f,0f],RightArm:[0f,0f,0f]},HandItems:[{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:3420009}},{}]}
scoreboard players set @e[type=hopper_minecart,tag=gm4_ender_hopper,distance=..0.2] gm4_entity_version 1
execute as @e[type=hopper_minecart,tag=gm4_ender_hopper,distance=..0.2] run data merge entity @s {CustomName:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Minecart with Ender Hopper","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.ender_hopper_minecart","font":"gm4:container_gui","color":"white"},{"text":"Minecart with Ender Hopper","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.ender_hopper_minecart","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.ender_hopper_minecart","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.ender_hopper_minecart","font":"minecraft:default","color":"#373737"}]]}]}',Tags:["gm4_ender_hopper_minecart","gm4_machine_cart"]}
scoreboard players set @s gm4_entity_version 1
