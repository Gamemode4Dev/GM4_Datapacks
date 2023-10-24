# spawn marker to get player position
# @s = marker
# at unspecified
# run from evaluate/motion

tp @s @p[tag=gm4_bookshelf_inspector_target]
data modify storage gm4_bookshelf_inspector:temp entity_data set from entity @s
data modify storage gm4_bookshelf_inspector:temp Motion set from storage gm4_bookshelf_inspector:temp entity_data.Motion
data modify storage gm4_bookshelf_inspector:temp Rotation set from storage gm4_bookshelf_inspector:temp entity_data.Rotation
data remove storage gm4_bookshelf_inspector:temp entity_data
kill @s
