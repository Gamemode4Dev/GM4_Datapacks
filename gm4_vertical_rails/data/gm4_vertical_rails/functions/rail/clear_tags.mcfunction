# Checks if Vertical Rails go up or downward, prioritising up
# @s = minecart, on a rail + not touching a Vertical Rail (ladder), with gm4_vert_rails_momentum tag
# at @s
# run from process

tag @s remove gm4_vert_rail_momentum
tag @s remove gm4_vert_rail_down
tag @s remove gm4_vert_rail_up
