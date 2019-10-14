# @s = freshly spawned roaming bee
# at the origin beehive
# run from beehavior/spawn_angry_bee

# assigns roaming center coordinates
data modify entity @s BoundX set from entity @s Pos[0]
data modify entity @s BoundY set from entity @s Pos[1]
data modify entity @s BoundZ set from entity @s Pos[2]

# set kill timer low
scoreboard players set @s gm4_bee_data 51

# remove fresh bee tag
tag @s remove gm4_new_bee
