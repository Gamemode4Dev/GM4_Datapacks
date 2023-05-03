# places the custom_crafter down based on rotation
# @s = player who placed the custom_crafter
# located at the center of the placed block
# run from gm4_custom_crafters:machine/create

# place dropper
setblock ~ ~ ~ dropper[facing=down]{CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.custom_crafter","fallback":"Custom Crafter"},[{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.custom_crafter","fallback":"Custom Crafter","font":"gm4:half_invert"},{"translate":"container.gm4.custom_crafter","fallback":"Custom Crafter","font":"gm4:offscreen"},{"translate":"gui.gm4.custom_crafter","fallback":"","font":"gm4:container_gui","color":"white"},{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.custom_crafter","fallback":"Custom Crafter","font":"gm4:half_invert"},{"translate":"container.gm4.custom_crafter","fallback":"Custom Crafter","font":"gm4:default","color":"#404040"}]]}'}

# summon display armor stand and marker entity
summon armor_stand ~ ~-0.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_custom_crafter_stand","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_custom_crafter_stand"',ArmorItems:[{},{},{},{id:"crafting_table",Count:1,tag:{CustomModelData:3420007}}],Rotation:[180.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["gm4_custom_crafter","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_custom_crafter"',Rotation:[180.0f,0.0f]}
