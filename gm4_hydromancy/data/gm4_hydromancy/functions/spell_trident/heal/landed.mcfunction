# upright trident that just landed
# @s = spell trident
# at @s
# run from spell_trident/heal/process

# set rotation to point towards the sky
scoreboard players set $yaw gm4_hy_data 0
execute if block ~ ~ ~0.1 #gm4:full_collision run scoreboard players set $yaw gm4_hy_data 1
execute if score $yaw gm4_hy_data matches 0 if block ~ ~ ~-0.1 #gm4:full_collision run scoreboard players set $yaw gm4_hy_data 6
execute if block ~0.1 ~ ~ #gm4:full_collision run scoreboard players add $yaw gm4_hy_data 2
execute if block ~-0.1 ~ ~ #gm4:full_collision run scoreboard players add $yaw gm4_hy_data 4
execute if score $yaw gm4_hy_data matches 1.. run function gm4_hydromancy:spell_trident/heal/set_yaw
execute if score $yaw gm4_hy_data matches 0 run data modify entity @s Rotation[1] set value -85F

# add interaction entity for picking up trident
summon interaction ~ ~-0.05 ~ {width:0.5f,height:1.7f,Tags:["gm4_hy_heal.interact"],response:1b}
tag @s add gm4_hy_spell_trident.heal.initiated
