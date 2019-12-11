#check for arrow that places a torch or crop
execute as @e[type=minecraft:arrow,tag=gm4_cb_torch,nbt={inGround:1b}] at @s run function gm4_crossbow_cartridges:torch/torch_check
