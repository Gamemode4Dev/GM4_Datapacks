# @s = hologram text display if empty item frame is nearby
# at @s positioned ^ ^ ^-0.3 (block face the hologram was placed from)
# run from main

# prepare data to reduce selector count
data modify storage gm4_holographic_tags:temp properties.rotation_hologram set from entity @s Rotation
execute store result storage gm4_holographic_tags:temp properties.rotation_x_hologram int 1 run data get storage gm4_holographic_tags:temp properties.rotation_hologram[0]
execute store result storage gm4_holographic_tags:temp properties.rotation_y_hologram int 1 run data get storage gm4_holographic_tags:temp properties.rotation_hologram[1]
data modify storage gm4_holographic_tags:temp properties.text set from entity @s text.text

# attempt move data from hologram to item frame, if destroy failed, also fail this function
execute as @e[type=#gm4_holographic_tags:item_frames,limit=1,sort=nearest,distance=..0.1] unless function gm4_holographic_tags:read_hologram_data run return fail
data remove storage gm4_holographic_tags:temp properties

# particles & hologram removal
particle minecraft:block{block_state:"minecraft:stripped_birch_log"} ~ ~ ~ .2 .2 .2 .1 10
kill @s
