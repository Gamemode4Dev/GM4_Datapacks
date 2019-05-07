#@s = pulverizers containing a recipe results
#Run from chance/apply_chance

execute if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"log"}}}}]} if score chance_stack gm4_stack_size matches 1.. run replaceitem block ~ ~ ~ container.7 stick{gm4_pulverizers:{chance:1}} 1
execute if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"planks"}}}}]} if score chance_stack gm4_stack_size matches 1.. run replaceitem block ~ ~ ~ container.7 stick{gm4_pulverizers:{chance:1}} 1
execute if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"blaze_rod"}}}}]} if score chance_stack gm4_stack_size matches 1.. run replaceitem block ~ ~ ~ container.7 blaze_powder{gm4_pulverizers:{chance:1}} 1
execute if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"bone"}}}}]} if score chance_stack gm4_stack_size matches 1.. run replaceitem block ~ ~ ~ container.7 bone_meal{gm4_pulverizers:{chance:1}} 1
execute if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"sugar_cane"}}}}]} if score chance_stack gm4_stack_size matches 1.. run replaceitem block ~ ~ ~ container.7 sugar{gm4_pulverizers:{chance:1}} 1
execute if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"music_disc"}}}}]} if score chance_stack gm4_stack_size matches 1.. run replaceitem block ~ ~ ~ container.7 flint{gm4_pulverizers:{chance:1}} 1
execute if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"andesite"}}}}]} if score chance_stack gm4_stack_size matches 1.. run replaceitem block ~ ~ ~ container.7 quartz{gm4_pulverizers:{chance:1}} 1
execute if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"diorite"}}}}]} if score chance_stack gm4_stack_size matches 1.. run replaceitem block ~ ~ ~ container.7 quartz{gm4_pulverizers:{chance:1}} 1
execute if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{chance:{id:"granite"}}}}]} if score chance_stack gm4_stack_size matches 1.. run replaceitem block ~ ~ ~ container.7 quartz 1