# Calculate push torque from the seated player for an z-axis swing
# @s = Player, sat on the swing seat
# at swing seat
# run from gm4_swings:seat/push/on_pusher

execute if entity @s[y_rotation=90..-90] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/normal
execute if entity @s[y_rotation=-90..90] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/inverse
