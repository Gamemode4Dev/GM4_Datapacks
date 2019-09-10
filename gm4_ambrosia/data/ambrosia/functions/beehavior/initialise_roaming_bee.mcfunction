# @s = freshly spawned roaming bee
# at the origin beehive
# run from beehavior/spawn_roaming_bee

# assigns roaming center coordinates
data modify entity @s BoundX set from entity @s Pos[0]
data modify entity @s BoundY set from entity @s Pos[1]
data modify entity @s BoundZ set from entity @s Pos[2]

# remove fresh bee tag
tag @s remove gm4_new_bee
