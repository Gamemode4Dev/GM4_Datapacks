# updates old machine armor stands
# @s = forming_press armor stand
# located at @s
# run from gm4_liquid_tanks:main

execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_liquid_tank","gm4_machine_marker","smithed.block"],CustomName:'"gm4_liquid_tank"'}
data merge entity @s {Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_liquid_tank_stand"'}
scoreboard players set @s gm4_entity_version 1
execute align xyz positioned ~0.5 ~0.5 ~0.5 run scoreboard players set @e[type=marker,tag=gm4_machine_marker,distance=..0.1,limit=1] gm4_entity_version 1
