# @s = totem of undying approached by a soul fragment
# from soul_fragment/seek_target

data merge entity @s {Item:{tag:{CustomModelData:1,Enchantments:[{}],display:{Name:'{"translate":"%1$s%3427655$s","with":["Soul in a Totem",{"translate":"item.gm4.soul_in_a_totem"}],"italic":false}'}}}}

execute store result entity @s Item.tag.gm4_soul_fragments.id int 1 run scoreboard players get @e[type=minecraft:area_effect_cloud,tag=gm4_sf_absorb,distance=..1.7,limit=1] gm4_sf_id
