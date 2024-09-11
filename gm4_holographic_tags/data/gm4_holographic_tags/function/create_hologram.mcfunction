# @s = item frame with renamed name tag
# run from main

summon area_effect_cloud ~ ~ ~ {CustomNameVisible:1,Particle:{type:"minecraft:block",block_state:"minecraft:air"},Age:-2147483647,Duration:2147483647,Tags:["gm4_hologram","smithed.entity","smithed.strict"]}
data modify entity @e[type=area_effect_cloud,tag=gm4_hologram,limit=1,sort=nearest,distance=..0.1] CustomName set from entity @s Item.components."minecraft:custom_name"
data modify entity @e[type=area_effect_cloud,tag=gm4_hologram,limit=1,sort=nearest,distance=..0.1] Rotation set from entity @s Rotation
scoreboard players set @e[type=area_effect_cloud,tag=gm4_hologram,limit=1,sort=nearest,distance=..0.1] gm4_entity_version 1
execute if block ^ ^ ^-0.75 #minecraft:wool as @e[type=area_effect_cloud,tag=gm4_hologram,limit=1,sort=nearest,distance=..0.1] run function gm4_holographic_tags:set_color
advancement grant @a[distance=..4,gamemode=!spectator] only gm4:holographic_tags
playsound minecraft:entity.item_frame.remove_item block @a
particle minecraft:block{block_state:"minecraft:stripped_acacia_log"} ~ ~ ~ .2 .2 .2 .1 10

execute if entity @s[type=item_frame] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1},PickupDelay:10s,Motion:[0.0,0.25,0.0]}
execute if entity @s[type=glow_item_frame] run summon item ~ ~ ~ {Item:{id:"minecraft:glow_item_frame",count:1},PickupDelay:10s,Motion:[0.0,0.25,0.0]}

kill @s
