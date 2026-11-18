# Calculate push torque from the pushing player for an z-axis swing
# @s = Player, pushing the swing (has punched the swing seat interaction)
# at swing seat
# run from gm4_swings:seat/push/on_pusher

execute if entity @s[y_rotation=90..-90] store result score $push_torque gm4_swings.dummy run return run compute default float gm4_swings:push_torque/normal 1000000
execute if entity @s[y_rotation=-90..90] store result score $push_torque gm4_swings.dummy run return run compute default float gm4_swings:push_torque/inverse 1000000
