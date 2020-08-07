#@s = water tank with one written book in the first slot
#run from wash

data remove block ~ ~ ~ Items[0].tag.resolved
data remove block ~ ~ ~ Items[0].tag.generation
data remove block ~ ~ ~ Items[0].tag.author
data remove block ~ ~ ~ Items[0].tag.pages
#note book tile may get removed if you really don't like that, well, §oI§r can't help you with that
data remove block ~ ~ ~ Items[0].tag.title
execute store result score @s gm4_wt_tag_size run data get block ~ ~ ~ Items[0].tag
execute if score @s gm4_wt_tag_size matches 0 run data remove block ~ ~ ~ Items[0].tag
scoreboard players reset @s gm4_wt_tag_size
data modify block ~ ~ ~ Items[0].id set value book
scoreboard players remove @s gm4_lt_value 1
tag @s add gm4_lt_fill
