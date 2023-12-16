# spawn marker to get player position and rotation
# @s = marker
# at @s
# run from evaluate/position

tp @s @p[tag=gm4_bookshelf_inspector_target]
data modify storage gm4_bookshelf_inspector:temp entity_data set from entity @s
data modify storage gm4_bookshelf_inspector:temp Pos set from storage gm4_bookshelf_inspector:temp entity_data.Pos
data modify storage gm4_bookshelf_inspector:temp Rotation set from storage gm4_bookshelf_inspector:temp entity_data.Rotation
data remove storage gm4_bookshelf_inspector:temp entity_data
kill @s
