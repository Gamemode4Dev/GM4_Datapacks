# places the liquid_tank down
# @s = player who placed the liquid_tank
# located at the center of the placed block
# run from gm4_liquid_tanks:machine/verify_place_down

# place hopper
execute if score $face_placement gm4_machine_data matches 1..2 run setblock ~ ~ ~ hopper[facing=down]{CustomName:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Empty Tank","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.liquid_tank","font":"gm4:container_gui","color":"white"},{"text":"Empty Tank","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.liquid_tank.empty","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.liquid_tank","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.liquid_tank.empty","font":"minecraft:default","color":"#373737"}]]}]}'}
execute if score $face_placement gm4_machine_data matches 3 run setblock ~ ~ ~ hopper[facing=south]{CustomName:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Empty Tank","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.liquid_tank","font":"gm4:container_gui","color":"white"},{"text":"Empty Tank","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.liquid_tank.empty","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.liquid_tank","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.liquid_tank.empty","font":"minecraft:default","color":"#373737"}]]}]}'}
execute if score $face_placement gm4_machine_data matches 4 run setblock ~ ~ ~ hopper[facing=west]{CustomName:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Empty Tank","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.liquid_tank","font":"gm4:container_gui","color":"white"},{"text":"Empty Tank","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.liquid_tank.empty","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.liquid_tank","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.liquid_tank.empty","font":"minecraft:default","color":"#373737"}]]}]}'}
execute if score $face_placement gm4_machine_data matches 5 run setblock ~ ~ ~ hopper[facing=north]{CustomName:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Empty Tank","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.liquid_tank","font":"gm4:container_gui","color":"white"},{"text":"Empty Tank","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.liquid_tank.empty","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.liquid_tank","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.liquid_tank.empty","font":"minecraft:default","color":"#373737"}]]}]}'}
execute if score $face_placement gm4_machine_data matches 6 run setblock ~ ~ ~ hopper[facing=east]{CustomName:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Empty Tank","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.liquid_tank","font":"gm4:container_gui","color":"white"},{"text":"Empty Tank","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.liquid_tank.empty","font":"minecraft:default","color":"#373737"},[{"translate":"gui.gm4.liquid_tank","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.liquid_tank.empty","font":"minecraft:default","color":"#373737"}]]}]}'}

# summon display armor stand and marker entity
summon armor_stand ~ ~-0.5 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.block","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_liquid_tank_stand"',ArmorItems:[{},{},{},{id:"glass",Count:1,tag:{CustomModelData:3420001}}]}
summon marker ~ ~ ~ {Tags:["gm4_liquid_tank","gm4_new_liquid_tank","gm4_machine_marker","smithed.block","gm4_new_machine"],CustomName:'"gm4_liquid_tank"'}

# place block depending on face_placement
execute if score $face_placement gm4_machine_data matches 1..2 run function gm4_liquid_tanks:machine/rotate/down
execute if score $face_placement gm4_machine_data matches 2 run function gm4_liquid_tanks:machine/rotate/up
execute if score $face_placement gm4_machine_data matches 3 run function gm4_liquid_tanks:machine/rotate/south
execute if score $face_placement gm4_machine_data matches 4 run function gm4_liquid_tanks:machine/rotate/west
execute if score $face_placement gm4_machine_data matches 5 run function gm4_liquid_tanks:machine/rotate/north
execute if score $face_placement gm4_machine_data matches 6 run function gm4_liquid_tanks:machine/rotate/east

# initialize scores
execute as @e[type=marker,tag=gm4_new_liquid_tank,limit=1] run function gm4_liquid_tanks:machine/init_tank_scores

# mark block as placed
tag @e[type=marker] remove gm4_new_liquid_tank
playsound block.end_portal_frame.fill block @a[distance=..30] ~ ~ ~ 1 0.5
scoreboard players set $placed_block gm4_machine_data 1
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
tag @e[distance=..2] remove gm4_new_machine
