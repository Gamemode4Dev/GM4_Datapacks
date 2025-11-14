# Check arrow with tag gm4_cb_ctorch
# run from projectile/copper_torch
# scheduled by projectile/copper_torch/loop

execute as @e[tag=gm4_cb_ctorch,nbt={inGround:1b}] at @s run function gm4_crossbow_cartridges:projectile/copper_torch/check
execute if entity @e[tag=gm4_cb_ctorch,limit=1] run schedule function gm4_crossbow_cartridges:projectile/copper_torch/loop 4t
