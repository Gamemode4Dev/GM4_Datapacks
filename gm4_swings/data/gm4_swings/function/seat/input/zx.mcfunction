# Calculate push torque from the seated player for an zx-axis (diagonal) swing
# @s = Player, sat on the swing seat
# at swing seat
# run from gm4_swings:seat/push/on_pusher

execute if entity @s[y_rotation=0..90] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/ws/inverse
execute if entity @s[y_rotation=90..180] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/ad/inverse
execute if entity @s[y_rotation=180..-90] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/ws/normal
execute if entity @s[y_rotation=-90..0] run return run data modify storage gm4_swings:data player_torque set compute entity @s float gm4_swings:player_torque/ad/normal
