execute if entity @s[y_rotation=90..-90] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/normal
execute if entity @s[y_rotation=-90..90] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/inverse
