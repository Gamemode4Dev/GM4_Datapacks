# Check blocks, to place or drop copper torch
# @s = arrow with tag gm4_cb_ctorch, in a block
# at @s
# run from projectile/copper_torch/loop

# summon torch item if torch already exists at this block
execute if block ~ ~ ~ #gm4_crossbow_cartridges:torch store success score $dropped_item gm4_cb_misc run loot spawn ~ ~ ~ loot minecraft:blocks/copper_torch

# place torch if possible
execute if block ~ ~ ~ #gm4:replaceable run function gm4_crossbow_cartridges:projectile/copper_torch/place

# summon torch item if placing torch failed
execute unless block ~ ~ ~ #gm4_crossbow_cartridges:torch store success score $dropped_item gm4_cb_misc run loot spawn ~ ~ ~ loot minecraft:blocks/copper_torch

# item drop sound
execute if score $dropped_item gm4_cb_misc matches 1 run playsound minecraft:entity.item.pickup block @a[distance=..15]

# clean up
scoreboard players reset $dropped_item gm4_cb_misc
kill @s
