# analyzes the color of a mooshroom and tgs it
# @s = @e[type=mooshroom] that hasn't been analyzed
# at @s
# run from gm4_shroomites:mooshroom/shed_shroom

# analyze color
execute store success score $success gm4_shroom_data if data entity @s {Type:"brown"} run tag @s add gm4_brown_shroomite
execute unless score $success gm4_shroom_data matches 1.. run tag @s add gm4_red_shroomite
scoreboard players reset $success gm4_shroom_data

# remember that this mooshroom has been analyzed
tag @s add gm4_shroomite_analyzed
