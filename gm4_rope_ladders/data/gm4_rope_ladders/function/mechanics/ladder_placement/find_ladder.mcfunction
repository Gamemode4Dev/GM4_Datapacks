# @s = interacted rcd
# at player that interacts with a rcd interaction while holding ladder
# run from function: gm4_rope_ladders:mechanics/ladder_placement/interact_right_click_detection

# fail if different gametime
execute store result score $check_gametime gm4_rol_data run data get entity @s interaction.timestamp 1
execute unless score $gametime gm4_rol_data = $check_gametime gm4_rol_data run return run data remove entity @s interaction

# clear and continue
data remove entity @s interaction
execute at @s align xyz positioned ~.5 ~ ~.5 run function gm4_rope_ladders:mechanics/ladder_placement/scan_column
