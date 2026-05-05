# Check blocks, to place or drop copper torch
# @s = arrow with tag gm4_cb_ctorch, in a block
# at @s
# run from projectile/copper_torch/loop

# place torch if possible
execute if block ~ ~ ~ #gm4:replaceable run function gm4_crossbow_cartridges:projectile/copper_torch/place

# summon torch item if placing torch failed
execute unless score $torch_placed gm4_cb_misc matches 1 run loot spawn ~ ~ ~ loot minecraft:blocks/copper_torch
execute unless score $torch_placed gm4_cb_misc matches 1 run playsound minecraft:entity.item.pickup block @a[distance=..15]

# clean up
scoreboard players reset $torch_placed gm4_cb_misc
kill @s
