# places the enchantment_extractor down based on rotation
# @s = player who placed the enchantment_extractor
# located at the center of the placed block
# run from gm4_enchantment_extractors:machine/create

# place dropper
setblock ~ ~ ~ dropper[facing=up]{CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.enchantment_extractor","fallback":"Enchantment Extractor"},[{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.enchantment_extractor","fallback":"Enchantment Extractor","font":"gm4:half_invert"},{"translate":"container.gm4.enchantment_extractor","fallback":"Enchantment Extractor","font":"gm4:offscreen"},{"translate":"gui.gm4.enchantment_extractor","fallback":"","font":"gm4:container_gui","color":"white"},{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.enchantment_extractor","fallback":"Enchantment Extractor","font":"gm4:half_invert"},{"translate":"container.gm4.enchantment_extractor","fallback":"Enchantment Extractor","font":"gm4:default","color":"#404040"}]]}'}

# summon display armor stand and marker entity
summon armor_stand ~ ~-1.2 ~ {NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_enchantment_extractor_stand","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_enchantment_extractor_stand"',ArmorItems:[{},{},{},{id:"minecraft:enchanting_table",Count:1b,tag:{CustomModelData:3420001}}],Rotation:[0.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["gm4_enchantment_extractor","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_enchantment_extractor"',Rotation:[0.0f,0.0f]}
