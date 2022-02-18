# updates nearby the air around ladder so that it breaks
# @s = freshly dropped ladder item
# positon of ladder
# run from function gm4_rope_ladders:update_ladders/scan_column/init

scoreboard players reset $ray_stop gm4_rol_data

setblock ~ ~ ~ air

loot spawn ~ ~ ~ loot gm4_rope_ladders:item/rope_ladder
