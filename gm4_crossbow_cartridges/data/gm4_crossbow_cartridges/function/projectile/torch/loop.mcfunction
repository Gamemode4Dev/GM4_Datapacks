# Check arrow with tag gm4_cb_torch
# run from projectile/torch
# scheduled by projectile/torch/loop

execute as @e[tag=gm4_cb_torch,nbt={inGround:1b}] at @s run function gm4_crossbow_cartridges:projectile/torch/check
execute if entity @e[tag=gm4_cb_torch,limit=1] run schedule function gm4_crossbow_cartridges:projectile/torch/loop 4t
