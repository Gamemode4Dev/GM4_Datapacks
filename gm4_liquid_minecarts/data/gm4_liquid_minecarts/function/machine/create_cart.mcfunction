# places the liquid_minecart down
# @s = hopper_minecart with the liquid_minecart name
# located at @s
# run from gm4_liquid_minecarts:machine/verify_place_cart

scoreboard players set $placed_block gm4_machine_data 1

# summon new command block minecart
summon command_block_minecart ~ ~ ~ {Command:"execute if score @s gm4_lt_value matches 1.. run function gm4_liquid_minecarts:drain_minecart",CustomName:{"text":"Liquid Minecart","italic":false},Tags:["gm4_liquid_minecart","gm4_liquid_minecart_empty","gm4_machine_cart","gm4_new_machine"],DisplayState:{"Name":"minecraft:hopper"},DisplayOffset:1,Passengers:[{id:"minecraft:item_display",Tags:["gm4_liquid_minecart_display","gm4_machine_cart","smithed.entity","smithed.strict","gm4_new_machine"],item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$liquid_minecart_display/empty","minecraft:custom_data":{gm4_liquid_minecarts:{liquid_tag:"null"}}}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.0,0.7275,0.0],scale:[0.83,0.83,0.83]},item_display:"head"}]}
tp @e[type=command_block_minecart,distance=..0.1,tag=gm4_new_machine] @s
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 2
execute as @e[type=command_block_minecart,distance=..0.1,tag=gm4_new_machine,limit=1] run function gm4_liquid_minecarts:liquid_value_update

# clean up
kill @s
tag @e[distance=..2] remove gm4_new_machine
