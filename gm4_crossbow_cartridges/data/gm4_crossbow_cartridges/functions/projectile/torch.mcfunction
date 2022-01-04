# Shoot torch
# @s = player using the crossbow
# at arrow
# run from check_projectile and projectile/torch

tag @s add gm4_cb_use

# add tag to arrow
tag @e[tag=gm4_cb_arrow,distance=..1,sort=nearest,limit=1] add gm4_cb_torch

# add fire to arrow
data merge entity @e[tag=gm4_cb_arrow,tag=gm4_cb_torch,distance=..1,sort=nearest,limit=1] {Fire:2000s}
tag @e[tag=gm4_cb_arrow,tag=gm4_cb_torch,distance=..1,sort=nearest,limit=1] remove gm4_cb_arrow

# clear torch from player
item modify entity @s[gamemode=!creative] weapon.offhand gm4_crossbow_cartridges:remove_item

# repeat
execute if entity @e[tag=gm4_cb_arrow,distance=..1,sort=nearest,limit=1] if entity @s[predicate=gm4_crossbow_cartridges:items/torch] run function gm4_crossbow_cartridges:projectile/torch

# start loop to check if arrow is in ground
schedule function gm4_crossbow_cartridges:projectile/torch/loop 4t
