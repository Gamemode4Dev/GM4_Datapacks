# places the ender_hopper_minecart down
# @s = hopper_minecart with the ender_hopper_minecart name
# located at @s
# run from gm4_ender_hoppers:machine/verify_place_cart

scoreboard players set $placed_block gm4_machine_data 1

# summon new hopper minecart
summon hopper_minecart ~ ~ ~ {Tags:["gm4_ender_hopper_minecart_new","gm4_new_machine"],Passengers:[{id:"minecraft:item_display",CustomName:'"gm4_ender_hopper_display"',Tags:["gm4_no_edit","gm4_ender_hopper_display","gm4_machine_cart","smithed.entity","smithed.strict","gm4_new_machine"],item:{id:"minecraft:player_head",count:1,components:{"minecraft:custom_model_data":"block/ender_hopper_minecart","minecraft:profile":"$ender_hopper_display"}},item_display:"head",transformation:{scale:[0.83,0.83,0.83],right_rotation:[0,0,0,1],left_rotation:[0,0,0,1],translation:[0.0,0.7275,0.0]}}]}
particle large_smoke ~ ~0.5 ~ 0.2 0.2 0.2 0 10
playsound minecraft:block.respawn_anchor.charge block @a[distance=..5] ~ ~ ~ 0.3 0.7
scoreboard players set @e[tag=gm4_new_machine,distance=..2] gm4_entity_version 1

# clean up
data modify entity @e[type=hopper_minecart,tag=gm4_ender_hopper_minecart_new,distance=..0.1,limit=1] {} merge from entity @s {}
data merge entity @e[type=hopper_minecart,tag=gm4_ender_hopper_minecart_new,distance=..0.1,limit=1] {CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.ender_hopper_minecart","fallback":"Minecart with Ender Hopper"},[{"translate":"gui.gm4.ender_hopper_minecart","fallback":"","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.ender_hopper_minecart","fallback":"Minecart with Ender Hopper","font":"gm4:default","color":"#404040"}]]}',Tags:["gm4_ender_hopper_minecart","gm4_machine_cart"]}
data merge entity @s {Items:[]}
kill @s
tag @e[distance=..2] remove gm4_new_machine
