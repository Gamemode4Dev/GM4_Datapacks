#ran by main
#@s is entity with gm4_chestpack as 1b in air block
#at @s
setblock ~ ~ ~ chest
data modify block ~ ~ ~ Items set from entity @s Item.tag.BlockEntityTag.Items 
playsound minecraft:block.wood.break block @a ~ ~ ~ 1 1
particle minecraft:block minecraft:chest ~ ~ ~ 0 0 0 1 15 force
kill @s