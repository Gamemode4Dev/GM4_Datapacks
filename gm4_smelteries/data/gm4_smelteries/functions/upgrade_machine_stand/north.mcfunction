# updates old machine armor stands
# @s = smeltery armor stand
# located at @s
# run from gm4_smelteries:upgrade_machine_stand

data modify storage gm4_smelteries:temp Items set from block ~ ~ ~ Items
execute align xyz run summon marker ~0.5 ~0.5 ~-0.5 {Tags:["gm4_smeltery","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_smeltery"',Rotation:[180.0f,0.0f]}
execute align xyz run summon armor_stand ~0.5 ~0.2 ~-0.5 {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_smeltery_stand","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_smeltery_stand"',ArmorItems:[{},{},{},{id:"minecraft:iron_block",Count:1b,tag:{CustomModelData:3420002}}],Rotation:[180.0f,0.0f]}
data merge entity @s {Silent:1,Small:0,Tags:["gm4_no_edit","gm4_smeltery_cauldron","gm4_machine_display","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_smeltery_cauldron"',ArmorItems:[{},{},{},{}],HandItems:[{},{}],Rotation:[180.0f,0.0f]}
data merge block ~ ~ ~-1 {CustomName:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Smeltery","font":"minecraft:default","color":"#373737"},[{"text":"Smeltery","font":"gm4:half_scale"},{"text":"Smeltery","font":"gm4:inverted"},{"text":"Smeltery","font":"gm4:inverted_spacing"},{"text":"Smeltery","font":"gm4:offscreen"},{"translate":"gui.gm4.smeltery","font":"gm4:container_gui","color":"white"},{"text":"Smeltery","font":"gm4:half_scale"},{"text":"Smeltery","font":"gm4:inverted"},{"text":"Smeltery","font":"gm4:inverted_spacing"},{"text":"Smeltery","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.smeltery","font":"minecraft:default","color":"#373737"},[{"translate":"container.gm4.smeltery","font":"gm4:half_scale"},{"translate":"container.gm4.smeltery","font":"gm4:inverted"},{"translate":"container.gm4.smeltery","font":"gm4:inverted_spacing"},{"translate":"container.gm4.smeltery","font":"gm4:offscreen"},{"translate":"gui.gm4.smeltery","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.smeltery","font":"gm4:half_scale"},{"translate":"container.gm4.smeltery","font":"gm4:inverted"},{"translate":"container.gm4.smeltery","font":"gm4:inverted_spacing"},{"translate":"container.gm4.smeltery","font":"minecraft:default","color":"#373737"}]]}]}'}
setblock ~ ~ ~ cauldron
tp @s ~ ~-1.1 ~

# link cauldron armor stand to smeltery marker
execute store result score $new gm4_smelt_id run data get entity @e[type=marker,distance=..2,tag=gm4_smeltery,tag=gm4_new_machine,limit=1] UUID[3]
scoreboard players operation @e[distance=..2,tag=gm4_new_machine] gm4_smelt_id = $new gm4_smelt_id

# set entity version
scoreboard players set @e[distance=..2,tag=gm4_new_machine] gm4_entity_version 1
tag @e[distance=..2] remove gm4_new_machine
