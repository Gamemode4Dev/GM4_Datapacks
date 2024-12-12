# places the disassembler down based on rotation
# @s = player who placed the disassembler
# located at the center of the placed block
# run from gm4_disassemblers:machine/create

# place dropper
setblock ~ ~ ~ dropper[facing=south]{CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.disassembler","fallback":"Disassembler"},[{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.disassembler","fallback":"Disassembler","font":"gm4:half_invert"},{"translate":"container.gm4.disassembler","fallback":"Disassembler","font":"gm4:offscreen"},{"translate":"gui.gm4.disassembler","fallback":"","font":"gm4:container_gui","color":"white"},{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.disassembler","fallback":"Disassembler","font":"gm4:half_invert"},{"translate":"container.gm4.disassembler","fallback":"Disassembler","font":"gm4:default","color":"#404040"}]]}'}

# summon display armor stand and marker entity
summon armor_stand ~ ~-0.4 ~ {Small:1b,NoGravity:1b,Marker:1b,Invulnerable:1b,Invisible:1b,Silent:1b,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_disassembler_stand","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1b,CustomName:'"gm4_disassembler_stand"',ArmorItems:[{},{},{},{id:"minecraft:tnt",count:1,components:{"minecraft:custom_model_data":"block/disassembler_side"}}],Rotation:[0.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["gm4_disassembler","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_disassembler"',Rotation:[0.0f,0.0f]}
