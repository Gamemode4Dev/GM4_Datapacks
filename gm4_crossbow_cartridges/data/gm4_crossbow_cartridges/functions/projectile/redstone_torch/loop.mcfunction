# Check arrow with tag gm4_cb_rtorch
# run from projectile/redstone_torch
# scheduled by projectile/redstone_torch/loop

execute as @e[tag=gm4_cb_rtorch,nbt={inGround:1b}] at @s run function gm4_crossbow_cartridges:projectile/redstone_torch/check
execute if entity @e[tag=gm4_cb_rtorch,limit=1] run schedule function gm4_crossbow_cartridges:projectile/redstone_torch/loop 4t
