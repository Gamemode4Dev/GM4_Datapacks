# determine the direction that the player faces
# @s = player wearing crampons
# at @s
# run from climbing_effects/add_climb_effects

# north:0, east:1, south:2, west:3
execute if entity @s[y_rotation=..-135] run scoreboard players set @s gm4_mountaineering_direction_facing 0
execute if entity @s[y_rotation=135..] run scoreboard players set @s gm4_mountaineering_direction_facing 0
execute if entity @s[y_rotation=-135..-45] run scoreboard players set @s gm4_mountaineering_direction_facing 1
execute if entity @s[y_rotation=-45..45] run scoreboard players set @s gm4_mountaineering_direction_facing 2
execute if entity @s[y_rotation=45..135] run scoreboard players set @s gm4_mountaineering_direction_facing 3
