#@s = water tank with one leather armour in the first slot
#run from wash

data remove block ~ ~ ~ Items[0].tag.display.color
execute store result score @s gm4_wt_tag_size run data get block ~ ~ ~ Items[0].tag
execute if score @s gm4_wt_tag_size matches 0 run data remove block ~ ~ ~ Items[0].tag
scoreboard players reset @s gm4_wt_tag_size
scoreboard players remove @s gm4_lt_value 1
tag @s add gm4_lt_fill
