# floodfill area with block displays
# @s = block display
# at first placed block display
# run from spell_trident/on_land/cast
# run from here

# count this block as placed
scoreboard players remove $builder.blocks_left gm4_hy_data 1

# store wall block in forceloaded chunk for checking
tag @s remove gm4_hy_builder.new
data modify entity @s Rotation set from storage gm4_hydromancy:temp builder.Rotation
data modify entity @s block_state.Name set from storage gm4_hydromancy:temp builder.block_id
execute at @s[tag=gm4_hy_builder.origin] run clone ^ ^ ^1 ^ ^ ^1 29999997 0 7130

# floodfill
execute at @s positioned ^1 ^ ^ unless entity @e[type=block_display,tag=gm4_hy_builder.marker,distance=..0.5] if block ~ ~ ~ #gm4:replaceable if blocks ^ ^ ^1 ^ ^ ^1 29999997 0 7130 all run summon block_display ~ ~ ~ {brightness:{sky:15,block:15},Tags:["gm4_hy_builder.marker","gm4_hy_builder.new","gm4_hy_builder.need_command"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.005f,-0.005f,-0.005f],scale:[0.01f,0.01f,0.01f]},block_state:{Name:"minecraft:stone"}}
execute at @s positioned ^-1 ^ ^ unless entity @e[type=block_display,tag=gm4_hy_builder.marker,distance=..0.5] if block ~ ~ ~ #gm4:replaceable if blocks ^ ^ ^1 ^ ^ ^1 29999997 0 7130 all run summon block_display ~ ~ ~ {brightness:{sky:15,block:15},Tags:["gm4_hy_builder.marker","gm4_hy_builder.new","gm4_hy_builder.need_command"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.005f,-0.005f,-0.005f],scale:[0.01f,0.01f,0.01f]},block_state:{Name:"minecraft:stone"}}
execute at @s positioned ^ ^1 ^ unless entity @e[type=block_display,tag=gm4_hy_builder.marker,distance=..0.5] if block ~ ~ ~ #gm4:replaceable if blocks ^ ^ ^1 ^ ^ ^1 29999997 0 7130 all run summon block_display ~ ~ ~ {brightness:{sky:15,block:15},Tags:["gm4_hy_builder.marker","gm4_hy_builder.new","gm4_hy_builder.need_command"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.005f,-0.005f,-0.005f],scale:[0.01f,0.01f,0.01f]},block_state:{Name:"minecraft:stone"}}
execute at @s positioned ^ ^-1 ^ unless entity @e[type=block_display,tag=gm4_hy_builder.marker,distance=..0.5] if block ~ ~ ~ #gm4:replaceable if blocks ^ ^ ^1 ^ ^ ^1 29999997 0 7130 all run summon block_display ~ ~ ~ {brightness:{sky:15,block:15},Tags:["gm4_hy_builder.marker","gm4_hy_builder.new","gm4_hy_builder.need_command"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.005f,-0.005f,-0.005f],scale:[0.01f,0.01f,0.01f]},block_state:{Name:"minecraft:stone"}}

# keep going if there are blocks left and there is room to spread
execute unless entity @e[type=block_display,tag=gm4_hy_builder.new] if score $builder.blocks_left gm4_hy_data matches 1.. run function gm4_hydromancy:spell_trident/builder/place_blocks/initialize
execute if score $builder.blocks_left gm4_hy_data matches 0 run function gm4_hydromancy:spell_trident/builder/place_blocks/initialize
execute if score $builder.blocks_left gm4_hy_data matches 1.. as @e[type=block_display,tag=gm4_hy_builder.new,limit=1,sort=nearest] run function gm4_hydromancy:spell_trident/builder/on_land/process_spell
