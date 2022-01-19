# updates old machine armor stands
# @s = forming_press armor stand
# located at @s
# run from gm4_liquid_tanks:main

execute if block ~ ~ ~ dropper[facing=up] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_liquid_tank","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict"],CustomName:'"gm4_liquid_tank"',Rotation:[0.0f,0.0f]}
execute if block ~ ~ ~ dropper[facing=up] run data merge entity @s {Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.block","smithed.entity","smithed.strict"],HasVisualFire:1,CustomName:'"gm4_liquid_tank_stand"',Rotation:[0.0f,0.0f]}
execute if block ~ ~ ~ dropper[facing=down] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_liquid_tank","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict"],CustomName:'"gm4_liquid_tank"',Rotation:[180.0f,0.0f]}
execute if block ~ ~ ~ dropper[facing=down] run data merge entity @s {Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.block","smithed.entity","smithed.strict"],HasVisualFire:1,CustomName:'"gm4_liquid_tank_stand"',Rotation:[180.0f,0.0f]}
execute if block ~ ~ ~ dropper[facing=north] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_liquid_tank","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict"],CustomName:'"gm4_liquid_tank"',Rotation:[180.0f,0.0f]}
execute if block ~ ~ ~ dropper[facing=north] run data merge entity @s {Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.block","smithed.entity","smithed.strict"],HasVisualFire:1,CustomName:'"gm4_liquid_tank_stand"',Rotation:[180.0f,0.0f]}
execute if block ~ ~ ~ dropper[facing=east] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_liquid_tank","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict"],CustomName:'"gm4_liquid_tank"',Rotation:[-90.0f,0.0f]}
execute if block ~ ~ ~ dropper[facing=east] run data merge entity @s {Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.block","smithed.entity","smithed.strict"],HasVisualFire:1,CustomName:'"gm4_liquid_tank_stand"',Rotation:[-90.0f,0.0f]}
execute if block ~ ~ ~ dropper[facing=south] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_liquid_tank","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict"],CustomName:'"gm4_liquid_tank"',Rotation:[0.0f,0.0f]}
execute if block ~ ~ ~ dropper[facing=south] run data merge entity @s {Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.block","smithed.entity","smithed.strict"],HasVisualFire:1,CustomName:'"gm4_liquid_tank_stand"',Rotation:[0.0f,0.0f]}
execute if block ~ ~ ~ dropper[facing=west] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_liquid_tank","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict"],CustomName:'"gm4_liquid_tank"',Rotation:[90.0f,0.0f]}
execute if block ~ ~ ~ dropper[facing=west] run data merge entity @s {Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.block","smithed.entity","smithed.strict"],HasVisualFire:1,CustomName:'"gm4_liquid_tank_stand"',Rotation:[90.0f,0.0f]}

execute unless block ~ ~ ~ hopper[facing=down] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 3420003

scoreboard players set @s gm4_entity_version 1
execute align xyz positioned ~0.5 ~0.5 ~0.5 run scoreboard players set @e[type=marker,tag=gm4_machine_marker,distance=..0.1,limit=1] gm4_entity_version 1
