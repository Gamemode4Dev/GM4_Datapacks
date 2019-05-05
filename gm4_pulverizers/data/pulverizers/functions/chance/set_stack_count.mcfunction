#@s = pulverizers containing a recipe results
#Run from chance/calculate_chance

execute if score result gm4_pv_chance matches ..50 if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"log"}}}}]} run scoreboard players add chance_stack gm4_stack_size 1
execute if score result gm4_pv_chance matches ..20 if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"planks"}}}}]} run scoreboard players add chance_stack gm4_stack_size 1
execute if score result gm4_pv_chance matches ..10 if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"blaze_rod"}}}}]} run scoreboard players add chance_stack gm4_stack_size 1
execute if score result gm4_pv_chance matches ..40 if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"bone"}}}}]} run scoreboard players add chance_stack gm4_stack_size 1
execute if score result gm4_pv_chance matches ..40 if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"sugar_cane"}}}}]} run scoreboard players add chance_stack gm4_stack_size 1
execute if score result gm4_pv_chance matches ..20 if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"music_disc"}}}}]} run scoreboard players add chance_stack gm4_stack_size 2
execute if score result gm4_pv_chance matches ..10 if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"andesite"}}}}]} run scoreboard players add chance_stack gm4_stack_size 1
execute if score result gm4_pv_chance matches ..15 if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"diorite"}}}}]} run scoreboard players add chance_stack gm4_stack_size 1
execute if score result gm4_pv_chance matches ..20 if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"granite"}}}}]} run scoreboard players add chance_stack gm4_stack_size 1