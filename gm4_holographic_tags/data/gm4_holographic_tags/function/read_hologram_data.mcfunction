# Moves data from the hologram to the item frame, unless their rotations are different
# @s = item frame ready to receive a nametag
# at block face hologram was placed from
# run from return_name_tag

# check if the rotation matches
data modify storage gm4_holographic_tags:temp properties.rotation_item_frame set from entity @s Rotation
execute store result storage gm4_holographic_tags:temp properties.rotation_x_item_frame int 1 run data get storage gm4_holographic_tags:temp properties.rotation_item_frame[0]
execute store result storage gm4_holographic_tags:temp properties.rotation_y_item_frame int 1 run data get storage gm4_holographic_tags:temp properties.rotation_item_frame[1]

execute store success storage gm4_holographic_tags:temp properties.rotation_x_differs int 1 run data modify storage gm4_holographic_tags:temp properties.rotation_x_hologram set from storage gm4_holographic_tags:temp properties.rotation_x_item_frame
execute if data storage gm4_holographic_tags:temp properties{rotation_x_differs:1} run return fail
execute store success storage gm4_holographic_tags:temp properties.rotation_y_differs int 1 run data modify storage gm4_holographic_tags:temp properties.rotation_y_hologram set from storage gm4_holographic_tags:temp properties.rotation_y_item_frame
execute if data storage gm4_holographic_tags:temp properties{rotation_y_differs:1} run return fail


# rotation matched, move data
data merge entity @s {Tags:["gm4_hologram"],Item:{id:"minecraft:name_tag",count:1,components:{"minecraft:repair_cost":0}}}
data modify entity @s Item.components."minecraft:custom_name" set from storage gm4_holographic_tags:temp properties.text

# signal that data transfer was successful
return 1
