# run from gm4_zauber_liquids:item_fill
# @s = tank being processed

# $item_value set in item_fill function for efficiency

data merge storage gm4_liquid_tanks:temp/tank {output:{id:potion,tag:{CustomPotionColor:8587123,CustomModelData:1,Potion:"minecraft:thick",HideFlags:33,gm4_zauber_cauldrons:{item:"wormhole_bottle"},Enchantments:[{id:"minecraft:protection",lvl:0s}],display:{Name:'{"translate":"%1$s%3427655$s","with":["Wormhole in a Bottle",{"translate":"item.gm4.wormhole_in_a_bottle"}],"italic":false}'}}}}
# if soulution merge additional data
execute if block ~ ~-1 ~ soul_fire run data modify storage gm4_liquid_tanks:temp/tank output.tag merge value {gm4_zauber_cauldrons:{bottle:{sips:9b,multi_use:1b}},display:{Lore:['[{"text":"9/9 ","color":"gray","italic":false},{"translate":"%1$s%3427655$s","with":[{"text":"Sips"},{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.lore.sips"}],"color":"gray","italic":false}]'],Name:'{"translate":"%1$s%3427655$s","with":["Wormhole in a Bottle Soulution",[{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.level.brimful"},{"translate":"item.gm4.wormhole_in_a_bottle"}]],"italic":false}'}}

# copy coords to item
execute store result storage gm4_liquid_tanks:temp/tank output.tag.gm4_zauber_cauldrons.cauldron_pos.x int 1 run scoreboard players get @s gm4_zl_warp_cx
execute store result storage gm4_liquid_tanks:temp/tank output.tag.gm4_zauber_cauldrons.cauldron_pos.y int 1 run scoreboard players get @s gm4_zl_warp_cy
execute store result storage gm4_liquid_tanks:temp/tank output.tag.gm4_zauber_cauldrons.cauldron_pos.z int 1 run scoreboard players get @s gm4_zl_warp_cz
execute store result storage gm4_liquid_tanks:temp/tank output.tag.gm4_zauber_cauldrons.cauldron_pos.dimension int 1 run scoreboard players get @s gm4_zl_warp_cd

data merge storage gm4_liquid_tanks:temp/tank {output:{id:"potion",tag:{Potion:"minecraft:fire_resistance"}}}
function gm4_liquid_tanks:smart_item_fill
tag @s add gm4_lt_fill
