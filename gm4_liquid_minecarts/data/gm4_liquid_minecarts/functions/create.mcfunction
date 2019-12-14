#@s = hopper minecart with upgrade recipe inside
#run from main

summon command_block_minecart ~ ~ ~ {Command:"execute if score @s gm4_lt_value matches 1.. run function gm4_liquid_minecarts:drain_minecart",Tags:["gm4_liquid_minecart","gm4_liquid_minecart_empty"],CustomDisplayTile:1,DisplayState:{"Name":"minecraft:hopper"},Passengers:[{id:"minecraft:armor_stand",Tags:["gm4_liquid_minecart_display","gm4_no_edit"],Invisible:1b,DisabledSlots:2039583,Small:1b,ArmorItems:[{},{},{},{}],Pose:{Head:[180.0f,0.0f,0.0f],RightArm:[0.0f,-90.0f,0.0f]}}]}
execute as @e[type=command_block_minecart,distance=..0,tag=gm4_liquid_minecart_empty] run function gm4_liquid_minecarts:liquid_value_update
data merge entity @s {Items:[]}
kill @s
