# @s = regular soul lantern approached by a soul fragment
# from intake_fragment

data merge entity @s {Item:{tag:{CustomModelData:1,Enchantments:[{}],display:{Name:'{"translate":"%1$s%3427655$s","with":["Soul in a Lantern",{"translate":"item.gm4.soul_in_a_lantern"}],"italic":false}'}}},PickupDelay:45}

execute store result entity @s Item.tag.gm4_soul_fragments.id int 1 run scoreboard players get @e[type=minecraft:area_effect_cloud,tag=gm4_sf_absorb,distance=..1.7,limit=1] gm4_sf_id
