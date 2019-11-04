execute as @e[type=item] store result score @s gm4_chestpack if data entity @s Item.tag.BlockEntityTag.Items[]
execute as @e[type=item,tag=!gm4_chestpack_processed,nbt={Item:{tag:{gm4_chestpack:1b}}}] at @s if score @s gm4_chestpack matches 0 if block ~ ~ ~ minecraft:chest run function chestpack:load_chestpack
execute as @e[type=item,tag=!gm4_chestpack_processed,nbt={Item:{tag:{gm4_chestpack:1b}},OnGround:1b}] at @s if score @s gm4_chestpack matches 1.. if block ~ ~ ~ minecraft:air run function chestpack:unload_chestpack

#,nbt={Item:{tag:{gm4_chestpack:1b}}}/