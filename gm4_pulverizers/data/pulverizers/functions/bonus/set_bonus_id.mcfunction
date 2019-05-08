#@s = pulverizers containing a recipe results
#Run from #pulverizers:set_bonus_id

execute if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{bonus:{id:"minecraft:stick"}}}}]} run replaceitem block ~ ~ ~ container.7 stick 1
execute if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{bonus:{id:"minecraft:blaze_powder"}}}}]} run replaceitem block ~ ~ ~ container.7 blaze_powder 1
execute if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{bonus:{id:"minecraft:bone_meal"}}}}]} run replaceitem block ~ ~ ~ container.7 bone_meal 1
execute if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{bonus:{id:"minecraft:sugar"}}}}]} run replaceitem block ~ ~ ~ container.7 sugar 1
execute if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{bonus:{id:"minecraft:flint"}}}}]} run replaceitem block ~ ~ ~ container.7 flint 1
execute if block ~ ~ ~ dropper{Items:[{Slot:8b,tag:{gm4_pulverizers:{bonus:{id:"minecraft:quartz"}}}}]} run replaceitem block ~ ~ ~ container.7 quartz 1
