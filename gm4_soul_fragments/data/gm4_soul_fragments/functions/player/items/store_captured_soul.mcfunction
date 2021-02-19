# @s = player approached soul fragment with a soul lantern in main hand
# from player/items/capture_in_*hand

execute in overworld run summon item 29999998 1 7134 {Item:{id:"minecraft:soul_lantern",tag:{CustomModelData:1,Enchantments:[{}],display:{Name:'{"translate":"%1$s%3427655$s","with":["Soul in a Lantern",{"translate":"item.gm4.soul_in_a_lantern"}],"italic":false}'}},Count:1b},Tags:["gm4_sf_new_nbt_storage","gm4_sf_nbt_storage"],Age:5999,PickupDelay:32767}

execute store result entity @e[type=item,tag=gm4_sf_new_nbt_storage,limit=1] Item.tag.gm4_soul_fragments.id int 1 run scoreboard players get @e[type=minecraft:area_effect_cloud,tag=gm4_sf_absorb,distance=..1.7,limit=1] gm4_sf_id

tag @e[type=item,tag=gm4_sf_nbt_storage] remove gm4_sf_new_nbt_storage

data modify storage gm4_soul_fragments:temp/item/soul_in_a_lantern Item set from entity @e[type=item,tag=gm4_sf_nbt_storage,limit=1] Item

data modify storage gm4_soul_fragments:temp/item/soul_in_a_lantern Item.Slot set value 0b

execute in overworld run data modify block 29999998 1 7134 Items append from storage gm4_soul_fragments:temp/item/soul_in_a_lantern Item