#@s = water tank with one filled map in the first slot
#run from wash

data remove block ~ ~ ~ Items[0].tag.map
data remove block ~ ~ ~ Items[0].tag.map_scale_direction
data remove block ~ ~ ~ Items[0].tag.Decorations
data remove block ~ ~ ~ Items[0].tag.display.MapColor
execute store result score @s gm4_wt_tag_size run data get block ~ ~ ~ Items[0].tag
execute if score @s gm4_wt_tag_size matches 0 run data remove block ~ ~ ~ Items[0].tag
scoreboard players reset @s gm4_wt_tag_size
data modify block ~ ~ ~ Items[0].id set value map
scoreboard players remove @s gm4_lt_value 1
tag @s add gm4_lt_fill
