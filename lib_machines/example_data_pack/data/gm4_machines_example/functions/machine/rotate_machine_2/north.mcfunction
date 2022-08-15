# place hopper
setblock ~ ~ ~ hopper[facing=north]{CustomName:'{"text":"Machine 2"}'}

# summon display armor stand and marker entity
summon armor_stand ~ ~-0.5 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,Silent:1,DisabledSlots:4144959,Tags:["machine_2_marker","smithed.entity","smithed.strict"],HasVisualFire:1,CustomName:'"machine_marker_2"',ArmorItems:[{},{},{},{id:"minecraft:gold_block",Count:1b}],Rotation:[180.0f,0.0f]}
summon marker ~ ~ ~ {Tags:["machine_2","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict"],CustomName:'"machine_2"',Rotation:[180.0f,0.0f]}
