#run from projectile/torch and projectile/torch/loop
# @s = player using the crossbow

#check for arrow that places a torch
execute as @e[type=minecraft:arrow,tag=gm4_cb_torch,nbt={inGround:1b}] at @s run function gm4_crossbow_cartridges:projectile/torch/check
execute if entity @e[type=minecraft:arrow,tag=gm4_cb_torch,limit=1] run schedule function gm4_crossbow_cartridges:projectile/torch/loop 16t
