# Check arrow with tag gm4_cb_storch
# run from projectile/soul_torch
# scheduled by projectile/soul_torch/loop

execute as @e[tag=gm4_cb_storch,nbt={inGround:1b}] at @s run function gm4_crossbow_cartridges:projectile/soul_torch/check
execute if entity @e[tag=gm4_cb_storch,limit=1] run schedule function gm4_crossbow_cartridges:projectile/soul_torch/loop 4t
