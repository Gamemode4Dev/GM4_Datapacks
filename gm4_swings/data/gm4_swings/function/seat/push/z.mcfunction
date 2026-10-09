execute if entity @s[y_rotation=90..-90] store result score $push_torque gm4_swings.dummy run return run compute default float gm4_swings:push_torque/normal 1000000
execute if entity @s[y_rotation=-90..90] store result score $push_torque gm4_swings.dummy run return run compute default float gm4_swings:push_torque/inverse 1000000
