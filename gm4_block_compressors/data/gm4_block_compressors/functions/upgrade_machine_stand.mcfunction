# updates old machine armor stands
# @s = block_compressor armor stand
# located at @s
# run from gm4_block_compressors:main

# update entities
execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["gm4_block_compressor","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict"],CustomName:'"gm4_block_compressor"',Rotation:[0.0f,0.0f]}
summon armor_stand ~ ~ ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_block_compressor_display","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_block_compressor_display"',HandItems:[{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:3420001}},{}],Pose:{RightArm:[0.0f,0.0f,0.0f]},Rotation:[0.0f,0.0f]}
data merge entity @s {Small:0,Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_block_compressor_stand","gm4_machine_stand","smithed.entity","smithed.strict"],HasVisualFire:1,CustomName:'"gm4_block_compressor_stand"',ArmorItems:[{},{},{},{id:"minecraft:purpur_block",Count:1b,tag:{CustomModelData:3420002}}],HandItems:[{},{}],Pose:{Head:[180f,0f,0f]},Rotation:[0.0f,0.0f]}
tp @s ~ ~-0.565 ~

# update dropper
data modify storage gm4_block_compressors:temp block set from block ~ ~ ~ {}
setblock ~ ~ ~ dropper[facing=down]
data modify block ~ ~ ~ {} merge from storage gm4_block_compressors:temp block
data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Compression Amount","font":"minecraft:default","color":"#373737"},[{"text":"Compression\\u00a0Amount","font":"gm4:half_scale"},{"text":"Compression\\u00a0Amount","font":"gm4:inverted"},{"text":"Compression\\u00a0Amount","font":"gm4:inverted_spacing"},{"text":"Compression\\u00a0Amount","font":"gm4:offscreen"},{"translate":"gui.gm4.block_compressor","font":"gm4:container_gui","color":"white"},{"text":"Compression\\u00a0Amount","font":"gm4:half_scale"},{"text":"Compression\\u00a0Amount","font":"gm4:inverted"},{"text":"Compression\\u00a0Amount","font":"gm4:inverted_spacing"},{"text":"Compression Amount","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.block_compressor","font":"minecraft:default","color":"#373737"},[{"translate":"container.gm4.block_compressor","font":"gm4:half_scale"},{"translate":"container.gm4.block_compressor","font":"gm4:inverted"},{"translate":"container.gm4.block_compressor","font":"gm4:inverted_spacing"},{"translate":"container.gm4.block_compressor","font":"gm4:offscreen"},{"translate":"gui.gm4.block_compressor","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.block_compressor","font":"gm4:half_scale"},{"translate":"container.gm4.block_compressor","font":"gm4:inverted"},{"translate":"container.gm4.block_compressor","font":"gm4:inverted_spacing"},{"translate":"container.gm4.block_compressor","font":"minecraft:default","color":"#373737"}]]}]}'}
data remove storage gm4_block_compressors:temp block

# store entity version
scoreboard players set @s gm4_entity_version 1
execute align xyz positioned ~0.5 ~0.5 ~0.5 run scoreboard players set @e[type=armor_stand,tag=gm4_block_compressor_display,distance=..0.5,limit=1] gm4_entity_version 1
execute align xyz positioned ~0.5 ~0.5 ~0.5 run scoreboard players set @e[type=marker,tag=gm4_machine_marker,distance=..0.1,limit=1] gm4_entity_version 1
