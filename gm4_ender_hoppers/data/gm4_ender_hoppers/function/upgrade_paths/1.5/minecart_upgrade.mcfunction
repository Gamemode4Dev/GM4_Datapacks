# run from upgrade_paths/1.5
# @s = existing ender hopper minecart (cart entity)

summon hopper_minecart ~ ~ ~ {Tags:["gm4_ender_hopper_minecart_new","gm4_new_machine"],Passengers:[{id:"minecraft:item_display",CustomName:"gm4_ender_hopper_display",Tags:["gm4_no_edit","gm4_ender_hopper_display","gm4_machine_cart","smithed.entity","smithed.strict","gm4_new_machine"],item:{id:"minecraft:player_head",count:1,components:{"minecraft:custom_model_data":"block/ender_hopper_minecart","minecraft:profile":"$ender_hopper_display"}},item_display:"head",transformation:{scale:[0.83,0.83,0.83],right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],translation:[0.0,0.7275,0.0]}}]}
data modify entity @e[type=hopper_minecart,tag=gm4_ender_hopper_minecart_new,distance=..0.1,limit=1] {} merge from entity @s {}
data merge entity @e[type=hopper_minecart,tag=gm4_ender_hopper_minecart_new,distance=..0.1,limit=1] {CustomName:{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.ender_hopper_minecart","fallback":"Minecart with Ender Hopper"},[{"translate":"gui.gm4.ender_hopper_minecart","fallback":"","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.ender_hopper_minecart","fallback":"Minecart with Ender Hopper","font":"gm4:default","color":"#404040"}]]},Tags:["gm4_ender_hopper_minecart","gm4_machine_cart"]}

data merge entity @s {Items:[]}
execute on passengers run kill @s
kill @s
tag @e[distance=..2] remove gm4_new_machine
