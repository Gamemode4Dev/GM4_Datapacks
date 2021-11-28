# places the liquid_tank down
# @s = player who placed the liquid_tank
# located at the center of the placed block
# run from gm4_liquid_tanks:machine/verify_placement

# place hopper
execute if score $face_placement gm4_machine_data matches 1..2 run setblock ~ ~ ~ hopper[facing=down]{CustomName:'{"translate":"%1$s%3427655$s","with":["Empty Tank",{"translate":"container.gm4.liquid_tank.empty"}]}'}
execute if score $face_placement gm4_machine_data matches 3 run setblock ~ ~ ~ hopper[facing=south]{CustomName:'{"translate":"%1$s%3427655$s","with":["Empty Tank",{"translate":"container.gm4.liquid_tank.empty"}]}'}
execute if score $face_placement gm4_machine_data matches 4 run setblock ~ ~ ~ hopper[facing=west]{CustomName:'{"translate":"%1$s%3427655$s","with":["Empty Tank",{"translate":"container.gm4.liquid_tank.empty"}]}'}
execute if score $face_placement gm4_machine_data matches 5 run setblock ~ ~ ~ hopper[facing=north]{CustomName:'{"translate":"%1$s%3427655$s","with":["Empty Tank",{"translate":"container.gm4.liquid_tank.empty"}]}'}
execute if score $face_placement gm4_machine_data matches 6 run setblock ~ ~ ~ hopper[facing=east]{CustomName:'{"translate":"%1$s%3427655$s","with":["Empty Tank",{"translate":"container.gm4.liquid_tank.empty"}]}'}

# summon display armor stand and marker entity
summon armor_stand ~ ~-0.5 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,Tags:["gm4_no_edit","gm4_liquid_tank_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_liquid_tank_stand"',ArmorItems:[{},{},{},{id:"glass",Count:1,tag:{CustomModelData:3420001}}]}
summon marker ~ ~ ~ {Tags:["gm4_liquid_tank","gm4_new_liquid_tank","gm4_machine_marker","smithed.block"],CustomName:'"gm4_liquid_tank"'}

# initialize scores
execute as @e[type=marker,tag=gm4_new_liquid_tank,limit=1] run function gm4_liquid_tanks:machine/init_tank_scores

# mark block as placed
tag @e[type=marker] remove gm4_new_liquid_tank
playsound block.end_portal_frame.fill block @a[distance=..30] ~ ~ ~ 1 0.5
scoreboard players set $placed_block gm4_machine_data 1
