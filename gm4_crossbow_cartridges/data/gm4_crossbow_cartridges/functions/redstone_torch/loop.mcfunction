#check for arrow that places a torch
execute as @e[type=minecraft:arrow,tag=gm4_cb_rtorch,nbt={inGround:1b}] at @s run function gm4_crossbow_cartridges:redstone_torch/check
execute if entity @e[type=minecraft:arrow,tag=gm4_cb_rtorch] run schedule function gm4_crossbow_cartridges:redstone_torch/loop 16t
