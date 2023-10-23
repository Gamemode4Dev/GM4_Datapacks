# spawn marker to get player position
# @s = marker
# at unspecified
# run from evaluate/motion

tp @s @p[tag=gm4_bookshelf_nametags_target]
data modify storage gm4_bookshelf_nametags:temp Motion set from entity @s Motion
data modify storage gm4_bookshelf_nametags:temp Rotation set from entity @s Rotation
kill @s
