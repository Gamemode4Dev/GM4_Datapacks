# places the liquid_minecart down
# @s = hopper_minecart with the liquid_minecart name
# located at @s
# run from gm4_liquid_minecarts:machine/verify_place_cart

# summon new command block minecart
summon command_block_minecart ~ ~ ~ {Command:"execute if score @s gm4_lt_value matches 1.. run function gm4_liquid_minecarts:drain_minecart",CustomName:'{"text":"Liquid Minecart","italic":false}',Tags:["gm4_liquid_minecart","gm4_liquid_minecart_empty","gm4_machine_cart","gm4_new_machine"],CustomDisplayTile:1,DisplayState:{"Name":"minecraft:hopper"},Passengers:[{id:"minecraft:armor_stand",Tags:["gm4_no_edit","gm4_liquid_minecart_stand","gm4_machine_cart","smithed.entity","smithed.strict","gm4_new_machine"],Invisible:1b,DisabledSlots:2039583,Small:1b,ArmorItems:[{id:"minecraft:stick",Count:1,tag:{gm4_liquid_minecarts:{liquid_tag:"null"}}},{},{},{}],Pose:{Head:[180.0f,0.0f,0.0f],RightArm:[0.0f,-90.0f,0.0f]}}]}
tp @e[type=command_block_minecart,distance=..0.1,tag=gm4_new_machine] @s
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
execute as @e[type=command_block_minecart,distance=..0.1,tag=gm4_new_machine,limit=1] run function gm4_liquid_minecarts:liquid_value_update

# clean up
kill @s
tag @e[distance=..2] remove gm4_new_machine
