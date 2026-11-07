# Calculate push torque from the seated player for an xz-axis (diagonal) swing
# @s = Player, sat on the swing seat
# at swing seat
# run from gm4_swings:seat/push/on_pusher

execute if entity @s[y_rotation=45..-135] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/inverse
execute if entity @s[y_rotation=-135..45] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/normal
