# @s = teleportation jammer that lost its dropper
# run from blocks/process_jammer

loot spawn ~ ~.6 ~ loot gm4_teleportation_anchors:destroy_jammer
particle minecraft:block{block_state:"minecraft:purpur_block"} ~ ~1 ~ .1 .25 .1 .05 30 normal @a
kill @s
