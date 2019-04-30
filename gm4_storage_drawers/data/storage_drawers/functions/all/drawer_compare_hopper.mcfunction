#run from drawer_add_item in same folder
#@s = as drawer at hopper not point down on sides

setblock ~ 0 ~ minecraft:jukebox{RecordItem:{id: "minecraft:stone", Count:1b}}
data modify block ~ 0 ~ RecordItem.id set from entity @s Item.id
execute store success score @s gm4_sd_same run data modify block ~ 0 ~ RecordItem.id set from block ~ ~ ~ Items[0].id
execute if score @s gm4_sd_same matches 0 run tag @s add gm4_sd_compatable_hopper
setblock ~ 0 ~ bedrock