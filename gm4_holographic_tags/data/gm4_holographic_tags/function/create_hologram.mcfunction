# @s = item frame with renamed name tag
# run from main

# init text display
data modify storage gm4_holographic_tags:temp properties.raw_text set from entity @s Item.components."minecraft:custom_name"
execute if entity @s[type=glow_item_frame] run data modify storage gm4_holographic_tags:temp properties.glowing set value 1b
data modify storage gm4_holographic_tags:temp properties.rotation set from entity @s Rotation
execute summon text_display run function gm4_holographic_tags:initialize_hologram
data remove storage gm4_holographic_tags:temp properties

# sights and sounds
advancement grant @a[distance=..4,gamemode=!spectator] only gm4:holographic_tags
playsound minecraft:entity.item_frame.remove_item block @a
particle minecraft:block{block_state:"minecraft:stripped_acacia_log"} ~ ~ ~ .2 .2 .2 .1 10

# return item frame item
execute unless data storage gm4_holographic_tags:temp properties.glowing run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1},PickupDelay:10s,Motion:[0.0,0.25,0.0]}
execute if data storage gm4_holographic_tags:temp properties.glowing run summon item ~ ~ ~ {Item:{id:"minecraft:glow_item_frame",count:1},PickupDelay:10s,Motion:[0.0,0.25,0.0]}

kill @s
