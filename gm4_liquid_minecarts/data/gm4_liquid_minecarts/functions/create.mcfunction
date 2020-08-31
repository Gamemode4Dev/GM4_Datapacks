#@s = hopper minecart with upgrade recipe inside
#run from main

summon command_block_minecart ~ ~ ~ {Command:"execute if score @s gm4_lt_value matches 1.. run function gm4_liquid_minecarts:drain_minecart",CustomName:'{"text":"Liquid Minecart","italic":false}',Tags:["gm4_liquid_minecart","gm4_liquid_minecart_empty","gm4_machine"],CustomDisplayTile:1,DisplayState:{"Name":"minecraft:hopper"},Passengers:[{id:"minecraft:armor_stand",Tags:["gm4_liquid_minecart_display","gm4_no_edit"],Invisible:1b,DisabledSlots:2039583,Small:1b,ArmorItems:[{id:"minecraft:stick",Count:1,tag:{gm4_liquid_minecarts:{liquid_tag:"null"}}},{},{},{}],Pose:{Head:[180.0f,0.0f,0.0f],RightArm:[0.0f,-90.0f,0.0f]}}]}
execute as @e[type=command_block_minecart,distance=..0,tag=gm4_liquid_minecart_empty] run function gm4_liquid_minecarts:liquid_value_update
data merge entity @s {Items:[]}
kill @e[type=item,tag=gm4_liquid_minecarts_checking_glass,limit=1]
advancement grant @a[distance=..4,gamemode=!spectator] only gm4:liquid_minecarts_create
kill @s
