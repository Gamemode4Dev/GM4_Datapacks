# creates a trapped sign marker
# @s = raycast marker
# located at the center of the placed sign
# run from place_secret_trapped_sign

summon marker ~ ~ ~ {Tags:["gm4_trapped_sign","gm4_secret_trapped_sign","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_secret_trapped_sign"'}
scoreboard players set @e[type=marker,tag=gm4_trapped_sign,tag=gm4_new_machine,distance=..0.1,limit=1] gm4_entity_version 1

execute if block ~ ~ ~ acacia_sign run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_acacia_trapped_sign
execute if block ~ ~ ~ acacia_wall_sign run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_acacia_trapped_sign
execute if block ~ ~ ~ birch_sign run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_birch_trapped_sign
execute if block ~ ~ ~ birch_wall_sign run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_birch_trapped_sign
execute if block ~ ~ ~ crimson_sign run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_crimson_trapped_sign
execute if block ~ ~ ~ crimson_wall_sign run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_crimson_trapped_sign
execute if block ~ ~ ~ dark_oak_sign run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_dark_oak_trapped_sign
execute if block ~ ~ ~ dark_oak_wall_sign run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_dark_oak_trapped_sign
execute if block ~ ~ ~ jungle_sign run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_jungle_trapped_sign
execute if block ~ ~ ~ jungle_wall_sign run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_jungle_trapped_sign
execute if block ~ ~ ~ spruce_sign run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_spruce_trapped_sign
execute if block ~ ~ ~ spruce_wall_sign run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_spruce_trapped_sign
execute if block ~ ~ ~ warped_sign run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_warped_trapped_sign
execute if block ~ ~ ~ warped_wall_sign run tag @e[type=marker,tag=gm4_new_machine,limit=1,distance=..0.1] add gm4_warped_trapped_sign

tag @e[type=marker,distance=..0.1] remove gm4_new_machine
kill @s
