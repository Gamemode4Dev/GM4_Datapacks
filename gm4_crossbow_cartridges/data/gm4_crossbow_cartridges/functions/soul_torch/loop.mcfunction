#run from projectile/soul_torch and soul_torch/loop
# @s = player using the crossbow

#check for arrow that places a torch
execute as @e[type=minecraft:arrow,tag=gm4_cb_storch,nbt={inGround:1b}] at @s run function gm4_crossbow_cartridges:soul_torch/check
execute if entity @e[type=minecraft:arrow,tag=gm4_cb_storch] run schedule function gm4_crossbow_cartridges:soul_torch/loop 16t
