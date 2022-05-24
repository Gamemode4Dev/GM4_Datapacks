# places the block_compressor down
# @s = player who placed the block_compressor
# located at the center of the placed block
# run from gm4_block_compressors:machine/verify_place_down

# place dropper
setblock ~ ~ ~ dropper[facing=down]{CustomName:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Tinker Amount","font":"minecraft:default","color":"#373737"},[{"text":"Tinker\\u00a0Amount","font":"gm4:half_scale"},{"text":"Tinker\\u00a0Amount","font":"gm4:inverted"},{"text":"Tinker\\u00a0Amount","font":"gm4:inverted_spacing"},{"text":"Tinker\\u00a0Amount","font":"gm4:offscreen"},{"translate":"gui.gm4.tinkering_compressor","font":"gm4:container_gui","color":"white"},{"text":"Tinker\\u00a0Amount","font":"gm4:half_scale"},{"text":"Tinker\\u00a0Amount","font":"gm4:inverted"},{"text":"Tinker\\u00a0Amount","font":"gm4:inverted_spacing"},{"text":"Tinker Amount","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.tinkering_compressor","font":"minecraft:default","color":"#373737"},[{"translate":"container.gm4.tinkering_compressor","font":"gm4:half_scale"},{"translate":"container.gm4.tinkering_compressor","font":"gm4:inverted"},{"translate":"container.gm4.tinkering_compressor","font":"gm4:inverted_spacing"},{"translate":"container.gm4.tinkering_compressor","font":"gm4:offscreen"},{"translate":"gui.gm4.tinkering_compressor","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.tinkering_compressor","font":"gm4:half_scale"},{"translate":"container.gm4.tinkering_compressor","font":"gm4:inverted"},{"translate":"container.gm4.tinkering_compressor","font":"gm4:inverted_spacing"},{"translate":"container.gm4.tinkering_compressor","font":"minecraft:default","color":"#373737"}]]}]}'}

# summon display armor stand and marker entity
summon armor_stand ~ ~-0.965 ~ {NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_tinkering_compressor_stand","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_tinkering_compressor_stand"',ArmorItems:[{},{},{},{id:"minecraft:oxidized_cut_copper",Count:1b,tag:{CustomModelData:3420001}}],Pose:{Head:[180f,0f,0f]},Rotation:[0.0f,0.0f]}
summon armor_stand ~ ~-0.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_tinkering_compressor_display","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_tinkering_compressor_display"',HandItems:[{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:3420002}},{}],Pose:{RightArm:[0.0f,0.0f,0.0f]},Rotation:[0.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["gm4_tinkering_compressor","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_tinkering_compressor"',Rotation:[0.0f,0.0f]}

# mark block as placed
playsound minecraft:entity.firework_rocket.blast block @a[distance=..5]
particle cloud ~ ~ ~ 0.1 0.1 0.1 0.05 10
scoreboard players set $placed_block gm4_machine_data 1
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
tag @e[distance=..2] remove gm4_new_machine
