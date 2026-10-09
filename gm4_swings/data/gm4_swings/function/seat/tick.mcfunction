scoreboard players set $found_seat gm4_swings.dummy 1

# check if in block
scoreboard players set $hit_block gm4_swings.dummy 0
execute if block ^ ^ ^0.25 #minecraft:blocks_motion run scoreboard players set $hit_block gm4_swings.dummy 1
execute if block ^ ^ ^-0.25 #minecraft:blocks_motion run scoreboard players set $hit_block gm4_swings.dummy 1

# store position
data modify storage gm4_swings:data seat_pos set from entity @s Pos

# store push torque and clear
scoreboard players operation $push_torque gm4_swings.dummy = @s gm4_swings.push_torque
scoreboard players reset @s gm4_swings.push_torque
execute unless score $push_torque gm4_swings.dummy matches 0 store result storage gm4_swings:data player_torque double 0.000001 run return run scoreboard players get $push_torque gm4_swings.dummy

# check for player
scoreboard players set $has_player gm4_swings.dummy 0
data modify storage gm4_swings:data player_torque set value 0
data modify storage gm4_swings:temp seat_rotation set from entity @s Rotation[0]
execute on passengers if entity @s[type=minecraft:player] run return run function gm4_swings:seat/input/main

# player has dismounted
execute if entity @s[tag=gm4_swings.has_player] if score $has_player gm4_swings.dummy matches 0 run function gm4_swings:swing/no_player
