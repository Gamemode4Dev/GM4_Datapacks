#@s = empty liquid tank with item in first slot or entity on top
#run from liquid_tanks:item_process

# honey comb
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:player_head",tag:{gm4_ambrosia:{item:"honey_comb"}}}]} run function gm4_ambrosia:honey_tanks/liquid_init_honey

# honey bottle
execute if block ~ ~ ~ hopper{Items:[{Slot:0b,id:"minecraft:potion",tag:{gm4_ambrosia:{item:"honey_bottle"}}}]} run function gm4_ambrosia:honey_tanks/liquid_init_honey
