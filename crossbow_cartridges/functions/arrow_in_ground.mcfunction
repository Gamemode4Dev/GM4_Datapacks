#run from main
# @s = @e[type=minecraft:arrow,tag=gm4_cb_proj,nbt={inGround:1b}]
# at @s

#check arrow tags
execute if entity @s[tag=gm4_cb_torch] run function crossbow_cartridges:torch/torch_check
execute if entity @s[tag=gm4_cb_crops] run function crossbow_cartridges:crops/crop_check
