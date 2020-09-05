replaceitem block ~ ~ ~ container.0 potion{CustomPotionColor:8587123,CustomModelData:1,Potion:"minecraft:thick",HideFlags:33,gm4_zauber_cauldrons:{item:"wormhole_bottle"},Enchantments:[{lvl:0s,id:"minecraft:protection"}],display:{Name:'{"translate":"%1$s%3427655$s","with":["Wormhole in a Bottle",{"translate":"item.gm4.wormhole_in_a_bottle"}],"italic":"false"}'}}
# copy coords to item
execute store result block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.cauldron_pos.x int 1 run scoreboard players get @s gm4_zc_warp_ox
execute store result block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.cauldron_pos.y int 1 run scoreboard players get @s gm4_zc_warp_oy
execute store result block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.cauldron_pos.z int 1 run scoreboard players get @s gm4_zc_warp_oz
execute store result block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.cauldron_pos.dimension int 1 run scoreboard players get @s gm4_zc_warp_od

scoreboard players remove @s gm4_lt_value 1
tag @s add gm4_lt_fill
