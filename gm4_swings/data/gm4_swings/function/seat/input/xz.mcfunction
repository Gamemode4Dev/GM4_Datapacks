execute if entity @s[y_rotation=45..-135] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/inverse
execute if entity @s[y_rotation=-135..45] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/normal
