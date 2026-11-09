# Calculate push torque from the seated player for an z-axis swing
# @s = Player, sat on the swing seat
# at swing seat
# run from gm4_swings:seat/push/on_pusher

say wah
execute if entity @s[y_rotation=-45..45] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/ws/normal
execute if entity @s[y_rotation=45..135] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/ad/normal
execute if entity @s[y_rotation=135..-135] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/ws/inverse
execute if entity @s[y_rotation=-135..-180] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/ad/inverse
