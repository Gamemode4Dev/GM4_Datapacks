# run from recipes/split_14_23

#4
execute if score @s gm4_stack_size matches ..16 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:bone"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:bone_meal",Count:1b,tag:{gm4_pulverizers:{multiplier:4,bonus:{id:"minecraft:bone_meal",chance:40,count:1}}}}]}

#5
execute if score @s gm4_stack_size matches ..32 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:poppy"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:rose_red",Count:1b,tag:{gm4_pulverizers:{multiplier:2}}}]}
execute if score @s gm4_stack_size matches ..16 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:lilac"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:magenta_dye",Count:1b,tag:{gm4_pulverizers:{multiplier:4}}}]}
execute if score @s gm4_stack_size matches ..16 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:peony"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:pink_dye",Count:1b,tag:{gm4_pulverizers:{multiplier:4}}}]}
execute if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:stone"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:cobblestone",Count:1b,tag:{gm4_pulverizers:{multiplier:1}}}]}

#6
execute if score @s gm4_stack_size matches ..16 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:bricks"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:brick",Count:1b,tag:{gm4_pulverizers:{multiplier:4}}}]}
execute if score @s gm4_stack_size matches ..32 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:allium"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:magenta_dye",Count:1b,tag:{gm4_pulverizers:{multiplier:2}}}]}
execute if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:gravel"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:flint",Count:1b,tag:{gm4_pulverizers:{multiplier:1}}}]}

#7
execute if score @s gm4_stack_size matches ..6 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:oak_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stick",Count:1b,tag:{gm4_pulverizers:{multiplier:10,bonus:{id:"minecraft:stick",chance:50,count:1}}}}]}
execute if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:granite"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:cobblestone",Count:1b,tag:{gm4_pulverizers:{multiplier:1,bonus:{id:"minecraft:quartz",chance:15,count:1}}}}]}
execute if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:diorite"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:cobblestone",Count:1b,tag:{gm4_pulverizers:{multiplier:1,bonus:{id:"minecraft:quartz",chance:20,count:1}}}}]}

#8
execute if score @s gm4_stack_size matches ..6 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:oak_wood"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stick",Count:1b,tag:{gm4_pulverizers:{multiplier:10,bonus:{id:"minecraft:stick",chance:50,count:1}}}}]}
execute if score @s gm4_stack_size matches ..5 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:iron_ore"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:iron_nugget",Count:1b,tag:{gm4_pulverizers:{multiplier:12}}}]}
execute if score @s gm4_stack_size matches ..5 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:gold_ore"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:gold_nugget",Count:1b,tag:{gm4_pulverizers:{multiplier:12}}}]}
execute if score @s gm4_stack_size matches ..64 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:andesite"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:cobblestone",Count:1b,tag:{gm4_pulverizers:{multiplier:1,bonus:{id:"minecraft:quartz",chance:10,count:1}}}}]}

#9
execute if score @s gm4_stack_size matches ..16 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:glowstone"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:glowstone_dust",Count:1b,tag:{gm4_pulverizers:{multiplier:4}}}]}
execute if score @s gm4_stack_size matches ..6 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:birch_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stick",Count:1b,tag:{gm4_pulverizers:{multiplier:10,bonus:{id:"minecraft:stick",chance:50,count:1}}}}]}
execute if score @s gm4_stack_size matches ..21 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:blaze_rod"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:blaze_powder",Count:1b,tag:{gm4_pulverizers:{multiplier:3,bonus:{id:"minecraft:blaze_powder",chance:10,count:1}}}}]}
execute if score @s gm4_stack_size matches ..32 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:dandelion"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:dandelion_yellow",Count:1b,tag:{gm4_pulverizers:{multiplier:2}}}]}
execute if score @s gm4_stack_size matches ..32 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:red_tulip"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:rose_red",Count:1b,tag:{gm4_pulverizers:{multiplier:2}}}]}
execute if score @s gm4_stack_size matches ..16 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:sunflower"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:dandelion_yellow",Count:1b,tag:{gm4_pulverizers:{multiplier:4}}}]}
execute if score @s gm4_stack_size matches ..16 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:rose_bush"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:rose_red",Count:1b,tag:{gm4_pulverizers:{multiplier:4}}}]}

#10
execute if score @s gm4_stack_size matches ..16 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:prismarine"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:prismarine_shard",Count:1b,tag:{gm4_pulverizers:{multiplier:4}}}]}
execute if score @s gm4_stack_size matches ..16 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:terracotta"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:clay_ball",Count:1b,tag:{gm4_pulverizers:{multiplier:4}}}]}
execute if score @s gm4_stack_size matches ..6 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:spruce_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stick",Count:1b,tag:{gm4_pulverizers:{multiplier:10,bonus:{id:"minecraft:stick",chance:50,count:1}}}}]}
execute if score @s gm4_stack_size matches ..6 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:jungle_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stick",Count:1b,tag:{gm4_pulverizers:{multiplier:10,bonus:{id:"minecraft:stick",chance:50,count:1}}}}]}
execute if score @s gm4_stack_size matches ..6 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:acacia_log"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stick",Count:1b,tag:{gm4_pulverizers:{multiplier:10,bonus:{id:"minecraft:stick",chance:50,count:1}}}}]}
execute if score @s gm4_stack_size matches ..6 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:birch_wood"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stick",Count:1b,tag:{gm4_pulverizers:{multiplier:10,bonus:{id:"minecraft:stick",chance:50,count:1}}}}]}
execute if score @s gm4_stack_size matches ..21 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:oak_planks"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:stick",Count:1b,tag:{gm4_pulverizers:{multiplier:3,bonus:{id:"minecraft:stick",chance:20,count:1}}}}]}
execute if score @s gm4_stack_size matches ..32 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:pink_tulip"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:pink_dye",Count:1b,tag:{gm4_pulverizers:{multiplier:2}}}]}
execute if score @s gm4_stack_size matches ..32 if block ~ ~ ~ dropper{Items:[{Slot:0b,id:"minecraft:sugar_cane"}]} run data merge block ~ ~ ~ {Items:[{Slot:8b,id:"minecraft:sugar",Count:1b,tag:{gm4_pulverizers:{multiplier:2,bonus:{id:"minecraft:sugar",chance:40,count:1}}}}]}