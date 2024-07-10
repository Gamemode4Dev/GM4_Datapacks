
# arrow deals half damage and will disable shields
data modify entity @s damage set value 1
tag @s add gm4_ce_shield_break_attack

# get player pos
execute positioned ^ ^ ^10 summon marker run function gm4_combat_expanded:mob/process/elite/speed/skeleton/get_target_pos

# get vector
data modify storage gm4_combat_expanded:temp Pos set from entity @s Pos
execute store result score $motion_x gm4_ce_data run data get storage gm4_combat_expanded:temp Pos[0] 100
execute store result score $motion_y gm4_ce_data run data get storage gm4_combat_expanded:temp Pos[1] 100
execute store result score $motion_z gm4_ce_data run data get storage gm4_combat_expanded:temp Pos[2] 100

execute store result score $motion_x_offset gm4_ce_data run random value -128..128
execute store result score $motion_y_offset gm4_ce_data run random value -32..32
execute store result score $motion_z_offset gm4_ce_data run random value -128..128

scoreboard players operation $target_x gm4_ce_data += $motion_x_offset gm4_ce_data
scoreboard players operation $target_y gm4_ce_data += $motion_y_offset gm4_ce_data
scoreboard players operation $target_z gm4_ce_data += $motion_z_offset gm4_ce_data

scoreboard players operation $motion_x gm4_ce_data -= $target_x gm4_ce_data
scoreboard players operation $motion_y gm4_ce_data -= $target_y gm4_ce_data
scoreboard players operation $motion_z gm4_ce_data -= $target_z gm4_ce_data

# set motion
execute store result entity @s Motion[0] double -0.0016517 run scoreboard players get $motion_x gm4_ce_data
execute store result entity @s Motion[1] double -0.0016517 run scoreboard players get $motion_y gm4_ce_data
execute store result entity @s Motion[2] double -0.0016517 run scoreboard players get $motion_z gm4_ce_data

data remove storage gm4_combat_expanded:temp Pos
