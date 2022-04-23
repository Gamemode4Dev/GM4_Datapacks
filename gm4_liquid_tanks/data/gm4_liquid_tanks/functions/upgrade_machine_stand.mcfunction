# updates old machine armor stands
# @s = liquid_tank armor stand
# located at @s
# run from gm4_liquid_tanks:main

execute if block ~ ~ ~ hopper[facing=down] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_new_machine_marker"],CustomName:'"gm4_liquid_tank"',Rotation:[0.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=north] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_new_machine_marker"],CustomName:'"gm4_liquid_tank"',Rotation:[180.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=east] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_new_machine_marker"],CustomName:'"gm4_liquid_tank"',Rotation:[-90.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=south] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_new_machine_marker"],CustomName:'"gm4_liquid_tank"',Rotation:[0.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=west] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_new_machine_marker"],CustomName:'"gm4_liquid_tank"',Rotation:[90.0f,0.0f]}

# copy scores over
scoreboard players operation @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] gm4_lt_value = @s gm4_lt_value
scoreboard players operation @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] gm4_lt_max = @s gm4_lt_max
scoreboard players operation @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] gm4_lt_prior_val = @s gm4_lt_prior_val
scoreboard players operation @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] gm4_lt_disp_val = @s gm4_lt_disp_val
scoreboard players operation @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] gm4_zl_warp_cx = @s gm4_zl_warp_cx
scoreboard players operation @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] gm4_zl_warp_cy = @s gm4_zl_warp_cy
scoreboard players operation @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] gm4_zl_warp_cz = @s gm4_zl_warp_cz
scoreboard players operation @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] gm4_zl_warp_cd = @s gm4_zl_warp_cd

# copy tags over
data modify entity @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] Tags set from entity @s Tags
tag @e[type=marker,tag=gm4_no_edit,distance=..1,limit=1] add gm4_new_machine_marker

tag @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] add gm4_liquid_tank
tag @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] add gm4_machine_marker
tag @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] remove gm4_machine
tag @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] remove gm4_no_edit
tag @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] add smithed.block
tag @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] add smithed.entity
tag @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] add smithed.strict
tag @e[type=marker,tag=gm4_new_machine_marker,tag=!gm4_lt_empty,distance=..1,limit=1] add gm4_upgraded_liquid_tank
execute if entity @s[tag=gm4_lt_empty] run data modify block ~ ~ ~ CustomName set value '{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Empty Tank","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.liquid_tank","font":"gm4:container_gui","color":"white"},{"text":"Empty Tank","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.liquid_tank.empty","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.liquid_tank","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.liquid_tank.empty","font":"minecraft:default","color":"#373737"}]]}]}'

# update armor stand nbt
data merge entity @s {Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.entity","smithed.strict"],HasVisualFire:1,CustomName:'"gm4_liquid_tank_stand"',Rotation:[0.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=north] run data merge entity @s {Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.entity","smithed.strict"],HasVisualFire:1,CustomName:'"gm4_liquid_tank_stand"',Rotation:[180.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=east] run data merge entity @s {Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.entity","smithed.strict"],HasVisualFire:1,CustomName:'"gm4_liquid_tank_stand"',Rotation:[-90.0f,0.0f]}
execute if block ~ ~ ~ hopper[facing=west] run data merge entity @s {Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.entity","smithed.strict"],HasVisualFire:1,CustomName:'"gm4_liquid_tank_stand"',Rotation:[90.0f,0.0f]}
execute unless block ~ ~ ~ hopper[facing=down] run data modify entity @s ArmorItems[3].tag.CustomModelData set value 3420003

scoreboard players set @s gm4_entity_version 1
scoreboard players set @e[type=marker,tag=gm4_new_machine_marker,distance=..1,limit=1] gm4_entity_version 1
tag @e[type=marker,distance=..1] remove gm4_new_machine_marker
