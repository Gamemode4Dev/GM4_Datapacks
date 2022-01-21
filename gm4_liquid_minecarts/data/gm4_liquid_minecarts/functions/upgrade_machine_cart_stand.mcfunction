# updates old machine cart armor stands
# @s = liquid_minecarts_display armor stand
# located at @s
# run from gm4_liquid_minecarts:main

data merge entity @s {Tags:["gm4_no_edit","gm4_liquid_minecart_stand","gm4_machine_cart","smithed.entity","smithed.strict"],CustomName:'"gm4_liquid_minecart_stand"'}
scoreboard players set @e[type=command_block_minecart,tag=gm4_liquid_minecart,tag=!gm4_machine_cart,distance=..0.2] gm4_entity_version 1
tag @e[type=command_block_minecart,tag=gm4_liquid_minecart,distance=..0.2] add gm4_machine_cart
scoreboard players set @s gm4_entity_version 1
