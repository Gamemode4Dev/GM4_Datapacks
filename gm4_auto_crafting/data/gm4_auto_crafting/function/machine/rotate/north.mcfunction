# places the auto_crafter down based on rotation
# @s = player who placed the auto_crafter
# located at the center of the placed block
# run from gm4_auto_crafting:machine/create

# place dropper
setblock ~ ~ ~ dropper[facing=north]{CustomName:'{"translate":"gm4.second","fallback":"%1$s","with":[{"translate":"container.gm4.auto_crafter","fallback":"Set Recipe Shape"},[{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.auto_crafter","fallback":"Set Recipe Shape","font":"gm4:half_invert"},{"translate":"container.gm4.auto_crafter","fallback":"Set Recipe Shape","font":"gm4:offscreen"},{"translate":"gui.gm4.auto_crafter","fallback":"","font":"gm4:container_gui","color":"white"},{"text":" ","font":"gm4:half_invert"},{"translate":"container.gm4.auto_crafter","fallback":"Set Recipe Shape","font":"gm4:half_invert"},{"translate":"container.gm4.auto_crafter","fallback":"Set Recipe Shape","font":"gm4:default","color":"#404040"}]]}'}

# summon display armor stand and marker entity
summon armor_stand ~ ~-1.44 ~ {NoGravity:1b,Marker:1b,Invulnerable:1b,Invisible:1b,Silent:1b,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_auto_crafter_stand","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1b,CustomName:'"gm4_auto_crafter_stand"',ArmorItems:[{},{},{},{id:"minecraft:crafting_table",count:1,components:{"minecraft:custom_model_data":"block/auto_crafter"}}],Rotation:[180.0f,0.0f],Pose:{Head:[90.0f,0.0f,0.0f]}}
summon marker ~ ~ ~ {Tags:["gm4_auto_crafter","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_auto_crafter"',Rotation:[180.0f,0.0f]}
