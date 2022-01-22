

tag @s add gm4_machine_check
execute if entity @s[tag=gm4_machine_marker] if entity @e[type=marker,tag=!gm4_machine_check,tag=gm4_machine_marker,distance=..0.1,limit=1] run setblock ~ ~ ~ air destroy
execute if entity @s[tag=gm4_machine_marker] if block ~ ~ ~ #gm4_machines-1.0:empty_block run function #gm4_machines:destroy
execute if entity @s[tag=gm4_machine_cart,predicate=!gm4_machines-1.0:has_vehicle] at @s run function #gm4_machines:destroy_cart
tag @s remove gm4_machine_check
