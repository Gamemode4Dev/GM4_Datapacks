# destroys the block_compressor
# @s = block_compressor marker
# located at @s
# run from gm4_block_compressors:machine/verify_destroy

# kill entities related to machine block
execute positioned ~ ~-0.98 ~ run kill @e[type=armor_stand,tag=gm4_block_compressor_stand,limit=1,distance=..0.1]
execute positioned ~ ~-0.4 ~ run kill @e[type=armor_stand,tag=gm4_block_compressor_display,limit=1,distance=..0.1]
execute store result score $dropped_item gm4_machine_data run kill @e[type=item,distance=..1,nbt={Age:0s,Item:{id:"minecraft:dropper",Count:1b,tag:{display:{}}}},limit=1,sort=nearest]
kill @s

# drop item (unless broken in creative mode)
particle block piston ~ ~ ~ .1 .25 .1 .05 30 normal @a
execute if score $dropped_item gm4_machine_data matches 1 run loot spawn ~ ~ ~ loot gm4_block_compressors:items/block_compressor
