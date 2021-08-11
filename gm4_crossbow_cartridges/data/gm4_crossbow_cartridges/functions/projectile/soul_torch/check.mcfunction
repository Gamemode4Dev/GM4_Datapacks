# Check blocks, to place or drop soul torch
# @s = arrow with tag gm4_cb_storch, in a block
# at @s
# run from projectile/soul_torch/loop

# summon torch item if torch already exists at this block
execute if block ~ ~ ~ #gm4_crossbow_cartridges:torch run loot spawn ~ ~ ~ loot minecraft:blocks/soul_torch

# place torch if possible
execute if block ~ ~ ~ #gm4:replaceable run function gm4_crossbow_cartridges:projectile/soul_torch/place

# summon torch item if placing torch failed
execute unless block ~ ~ ~ #gm4_crossbow_cartridges:torch run loot spawn ~ ~ ~ loot minecraft:blocks/soul_torch

# place block sound
playsound minecraft:block.wood.place block @a[distance=..15]

# kill arrow
kill @s
