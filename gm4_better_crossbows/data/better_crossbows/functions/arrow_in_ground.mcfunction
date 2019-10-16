# @s = @e[type=minecraft:arrow,tag=gm4_cb_proj,nbt={inGround:1b}]
# at @s

#check arrow tags
execute if entity @s[tag=gm4_cb_torch] run function better_crossbows:place_torch
execute if entity @s[tag=gm4_cb_crops] if block ~ ~-.1 ~ #minecraft:dirt_like run function better_crossbows:crops/check
