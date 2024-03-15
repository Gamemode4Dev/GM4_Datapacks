# Assigns a tag to the marker, used to drop the correct item after destroying the sign
# @s = raycast marker
# located at the center of the placed sign
# run from machine/create_secret_trapped_sign and machine/create_trapped_sign

# The order of the tag name is inconsistent, but it stays like this for backwards compatibility
execute if block ~ ~ ~ #gm4_trapped_signs:acacia_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_acacia_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:bamboo_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_bamboo_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:birch_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_birch_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:cherry_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_cherry_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:crimson_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_crimson_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:dark_oak_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_dark_oak_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:jungle_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_jungle_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:mangrove_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_mangrove_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:oak_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_oak_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:spruce_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_spruce_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:warped_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_warped_trapped_sign

execute if block ~ ~ ~ #gm4_trapped_signs:acacia_hanging_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_acacia_hanging_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:bamboo_hanging_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_bamboo_hanging_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:birch_hanging_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_birch_hanging_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:cherry_hanging_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_cherry_hanging_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:crimson_hanging_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_crimson_hanging_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:dark_oak_hanging_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_dark_oak_hanging_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:jungle_hanging_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_jungle_hanging_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:mangrove_hanging_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_mangrove_hanging_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:oak_hanging_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_oak_hanging_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:spruce_hanging_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_spruce_hanging_trapped_sign
execute if block ~ ~ ~ #gm4_trapped_signs:warped_hanging_signs run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_warped_hanging_trapped_sign
