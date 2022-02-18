# begins scan of vertical column below the ladder item
# @s = freshly dropped ladder item
# positon of ladder item, align xyz positioned ~.5 ~-1 ~.5
# run from gm4_rope_ladders:update_ladders/as_player

execute unless block ~ ~2 ~ ladder run scoreboard players set $rope_drop gm4_rol_data 1
execute if block ~ ~2 ~ ladder run scoreboard players set $rope_drop gm4_rol_data 2

scoreboard players set $ray gm4_rol_data 0
execute anchored eyes run function gm4_rope_ladders:update_ladders/scan_column/ray

