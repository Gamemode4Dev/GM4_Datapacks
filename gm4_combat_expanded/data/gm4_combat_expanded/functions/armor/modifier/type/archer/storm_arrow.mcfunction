
# slightly adjust arrow motion
data modify storage gm4_combat_expanded:temp archer_arrow.Motion_adj set value [0.0d,0.0d,0.0d] 

execute store result score $mot_adjust gm4_ce_data run data get entity @s UUID[0]
scoreboard players operation $mot_adjust gm4_ce_data %= #64 gm4_ce_data
scoreboard players remove $mot_adjust gm4_ce_data 32
execute store result score $mot gm4_ce_data run data get storage gm4_combat_expanded:temp archer_arrow.Motion[0] 100
execute store result storage gm4_combat_expanded:temp archer_arrow.Motion_adj[0] double 0.01 run scoreboard players operation $mot gm4_ce_data += $mot_adjust gm4_ce_data

execute store result score $mot_adjust gm4_ce_data run data get entity @s UUID[1]
scoreboard players operation $mot_adjust gm4_ce_data %= #21 gm4_ce_data
scoreboard players remove $mot_adjust gm4_ce_data 10
execute store result score $mot gm4_ce_data run data get storage gm4_combat_expanded:temp archer_arrow.Motion[1] 100
execute store result storage gm4_combat_expanded:temp archer_arrow.Motion_adj[1] double 0.01 run scoreboard players operation $mot gm4_ce_data += $mot_adjust gm4_ce_data

execute store result score $mot_adjust gm4_ce_data run data get entity @s UUID[2]
scoreboard players operation $mot_adjust gm4_ce_data %= #64 gm4_ce_data
scoreboard players remove $mot_adjust gm4_ce_data 32
execute store result score $mot gm4_ce_data run data get storage gm4_combat_expanded:temp archer_arrow.Motion[2] 100
execute store result storage gm4_combat_expanded:temp archer_arrow.Motion_adj[2] double 0.01 run scoreboard players operation $mot gm4_ce_data += $mot_adjust gm4_ce_data

# set arrow data
data modify entity @s Motion set from storage gm4_combat_expanded:temp archer_arrow.Motion_adj
data modify entity @s Rotation set from storage gm4_combat_expanded:temp archer_arrow.Rotation
data modify entity @s damage set from storage gm4_combat_expanded:temp archer_arrow.damage
data modify entity @s crit set from storage gm4_combat_expanded:temp archer_arrow.crit
data modify entity @s Fire set from storage gm4_combat_expanded:temp archer_arrow.Fire
tag @s add gm4_ce_archer_arrow