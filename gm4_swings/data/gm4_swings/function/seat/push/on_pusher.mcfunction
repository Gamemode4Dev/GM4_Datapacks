# Figure out which direction the swing is facing
# @s = Player, pushing the swing (has punched the swing seat interaction)
# at swing seat
# run from gm4_swings:seat/push/main

# grab knockback to scale push (if any)
execute store result storage gm4_swings:temp knockback int 1 run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:knockback"

execute if data storage gm4_swings:temp {seat_rotation:0.0f} run return run function gm4_swings:seat/push/z
execute if data storage gm4_swings:temp {seat_rotation:90.0f} run return run function gm4_swings:seat/push/x
execute if data storage gm4_swings:temp {seat_rotation:45.0f} run return run function gm4_swings:seat/push/zx
execute if data storage gm4_swings:temp {seat_rotation:135.0f} run return run function gm4_swings:seat/push/xz
