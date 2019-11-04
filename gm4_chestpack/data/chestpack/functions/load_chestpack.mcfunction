#ran by main
#@s is entity with gm4_chestpack as 1b on a valid chest block
#at @s
data modify entity @s Item.tag.BlockEntityTag.Items set from block ~ ~ ~ Items
setblock ~ ~ ~ air
playsound minecraft:block.wood.break block @a ~ ~ ~ 1 1
particle minecraft:block minecraft:chest ~ ~ ~ 0 0 0 1 15 force
tag @s add gm4_chestpack_processed