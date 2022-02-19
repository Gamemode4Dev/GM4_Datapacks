# updates nearby the air around ladder so that it breaks
# @s = freshly dropped ladder item
# positon of ladder
# run from function gm4_rope_ladders:update_ladders/scan_column/init

scoreboard players remove $ray_stop gm4_rol_data 1

scoreboard players add $drop_item_count gm4_rol_data 1

playsound minecraft:block.scaffolding.fall ambient @a[distance=..15] ~ ~ ~ 1 .5

setblock ~ ~ ~ air

execute if score $rope_drop gm4_rol_data matches 2 run loot spawn ~ ~ ~ loot gm4_rope_ladders:item/rope_ladder
