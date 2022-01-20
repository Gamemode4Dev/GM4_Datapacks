summon marker ~ ~ ~ {CustomName:'"gm4_soul_glass"',Tags:["gm4_soul_glass","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"]}
scoreboard players operation @e[type=minecraft:marker,distance=..0.1,tag=gm4_new_machine,limit=1] gm4_sg_levels = @s gm4_sg_levels
scoreboard players operation @e[type=minecraft:marker,distance=..0.1,tag=gm4_new_machine,limit=1] gm4_sg_primary = @s gm4_sg_primary
scoreboard players operation @e[type=minecraft:marker,distance=..0.1,tag=gm4_new_machine,limit=1] gm4_sg_secondary = @s gm4_sg_secondary

kill @s
scoreboard players set @e[type=marker,tag=gm4_new_machine,distance=..0.1] gm4_entity_version 1
tag @e[type=marker,distance=..0.1] remove gm4_new_machine
