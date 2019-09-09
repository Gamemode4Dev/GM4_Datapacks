#@s = empty liquid tank with item in first slot or entity on top
#run from liquid_tanks:item_process

#zauber leaping
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:saddle"}]} run function ambrisoa:honey_tanks/liquid_init_honey

#DELETE ME
