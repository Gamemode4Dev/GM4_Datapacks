# places the smeltery down based on rotation
# @s = player who placed the smeltery
# located at the center of the placed block
# run from gm4_smelteries:machine/create

# place furnace
setblock ~ ~ ~ furnace[facing=north]{CustomName:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Smeltery","font":"minecraft:default","color":"#373737"},[{"text":"Smeltery","font":"gm4:half_scale"},{"text":"Smeltery","font":"gm4:inverted"},{"text":"Smeltery","font":"gm4:inverted_spacing"},{"text":"Smeltery","font":"gm4:offscreen"},{"translate":"gui.gm4.smeltery","font":"gm4:container_gui","color":"white"},{"text":"Smeltery","font":"gm4:half_scale"},{"text":"Smeltery","font":"gm4:inverted"},{"text":"Smeltery","font":"gm4:inverted_spacing"},{"text":"Smeltery","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.smeltery","font":"minecraft:default","color":"#373737"},[{"translate":"container.gm4.smeltery","font":"gm4:half_scale"},{"translate":"container.gm4.smeltery","font":"gm4:inverted"},{"translate":"container.gm4.smeltery","font":"gm4:inverted_spacing"},{"translate":"container.gm4.smeltery","font":"gm4:offscreen"},{"translate":"gui.gm4.smeltery","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.smeltery","font":"gm4:half_scale"},{"translate":"container.gm4.smeltery","font":"gm4:inverted"},{"translate":"container.gm4.smeltery","font":"gm4:inverted_spacing"},{"translate":"container.gm4.smeltery","font":"minecraft:default","color":"#373737"}]]}]}'}

# summon cauldron display armor stand
summon armor_stand ~ ~-1.5 ~1 {Silent:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_smeltery_cauldron","gm4_machine_display","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_smeltery_cauldron"',ArmorItems:[{},{},{},{}],Rotation:[180.0f,0.0f]}

# summon display armor stand and marker entity
summon armor_stand ~ ~-0.3 ~ {Silent:1,Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_smeltery_stand","gm4_machine_stand","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_smeltery_stand"',ArmorItems:[{},{},{},{id:"minecraft:iron_block",Count:1b,tag:{CustomModelData:3420002}}],Rotation:[180.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["gm4_smeltery","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_smeltery"',Rotation:[180.0f,0.0f]}
