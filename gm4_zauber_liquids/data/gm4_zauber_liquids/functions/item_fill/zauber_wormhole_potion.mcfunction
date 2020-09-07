replaceitem block ~ ~ ~ container.0 potion{CustomPotionColor:8587123,CustomModelData:1,Potion:"minecraft:thick",HideFlags:33,gm4_zauber_cauldrons:{item:"wormhole_bottle"},Enchantments:[{lvl:0s,id:"minecraft:protection"}],display:{Name:'{"translate":"%1$s%3427655$s","with":["Wormhole in a Bottle",{"translate":"item.gm4.wormhole_in_a_bottle"}],"italic":"false"}'}}
# copy coords to item
execute store result storage gm4_zauber_liquids:temp/item/fill/zauber_wormhole Item.tag.gm4_zauber_cauldrons.cauldron_pos.x int 1 run scoreboard players get @s gm4_zl_warp_cx
execute store result storage gm4_zauber_liquids:temp/item/fill/zauber_wormhole Item.tag.gm4_zauber_cauldrons.cauldron_pos.y int 1 run scoreboard players get @s gm4_zl_warp_cy
execute store result storage gm4_zauber_liquids:temp/item/fill/zauber_wormhole Item.tag.gm4_zauber_cauldrons.cauldron_pos.z int 1 run scoreboard players get @s gm4_zl_warp_cz
execute store result storage gm4_zauber_liquids:temp/item/fill/zauber_wormhole Item.tag.gm4_zauber_cauldrons.cauldron_pos.dimension int 1 run scoreboard players get @s gm4_zl_warp_cd
data modify block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons merge from storage gm4_zauber_liquids:temp/item/fill/zauber_wormhole Item.tag.gm4_zauber_cauldrons
data remove storage gm4_zauber_liquids:temp/item/fill/zauber_wormhole Item

scoreboard players remove @s gm4_lt_value 1
tag @s add gm4_lt_fill
