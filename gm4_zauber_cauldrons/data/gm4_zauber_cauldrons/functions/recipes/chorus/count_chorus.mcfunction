# @s=boiling zauber cauldron with bottled vex and enchanted_prismarine_shard inside.
# at align xyz
# run from cauldron/recipe_checks

# initialise fake players
scoreboard players set cancel_recipe gm4_zc_data 0

# set expected fullness for these recipes (stack chorus+stack popped chorus+enchanted_prismarine_shard+bottled vex)
scoreboard players set expected_item_amount gm4_zc_fullness 4

# read count from chorus fruit stacks
execute store result score raw_chorus_fullness gm4_zc_chorus run data get entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:chorus_fruit"}},limit=1] Item.Count 1
execute store result score popped_chorus_fullness gm4_zc_chorus run data get entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:popped_chorus_fruit"}},limit=1] Item.Count 1

# cancel recipe if one of the ingredients is missing
execute if score raw_chorus_fullness gm4_zc_chorus matches 0 run scoreboard players set cancel_recipe gm4_zc_data 2
execute if score popped_chorus_fullness gm4_zc_chorus matches 0 run scoreboard players set cancel_recipe gm4_zc_data 2

# check count against seed based count
execute unless score cancel_recipe gm4_zc_data matches 2 run scoreboard players operation raw_chorus_fullness gm4_zc_chorus -= required_chorus_fruit gm4_zc_chorus
execute unless score cancel_recipe gm4_zc_data matches 2 run scoreboard players operation popped_chorus_fullness gm4_zc_chorus -= required_popped_chorus_fruit gm4_zc_chorus

# prepare wormhole
execute unless score cancel_recipe gm4_zc_data matches 2 run data modify storage gm4_zauber_cauldrons:temp/item/wormhole/common Item set value {tag:{CustomModelData:1,gm4_zauber_cauldrons:{item:"wormhole_bottle"},Potion:"minecraft:thick",CustomPotionColor:8587123,Enchantments:[{id:"minecraft:protection",lvl:0s}],HideFlags:33,display:{Name:'{"translate":"%1$s%3427655$s","with":["Wormhole in a Bottle",{"translate":"item.gm4.wormhole_in_a_bottle"}],"italic":"false"}'}}}
execute unless score cancel_recipe gm4_zc_data matches 2 if score has_soul_fire gm4_zc_data matches 1 run data modify storage gm4_zauber_cauldrons:temp/item/wormhole/common Item.tag merge value {gm4_zauber_cauldrons:{bottle:{sips:9b,multi_use:1b}},display:{Lore:['[{"text":"9/9 ","color":"gray","italic":false},{"translate":"%1$s%3427655$s","with":[{"text":"Sips"},{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.lore.sips"}],"color":"gray","italic":false}]'],Name:'{"translate":"%1$s%3427655$s","with":["Wormhole in a Bottle Soulution",{"translate":"item.gm4.zauber_cauldrons.multi_sip_bottle.wormhole_in_a_bottle"}],"italic":"false"}'}}

# start incomplete recipe
execute unless score cancel_recipe gm4_zc_data matches 2 if score raw_chorus_fullness gm4_zc_chorus matches ..-1 run scoreboard players set cancel_recipe gm4_zc_data 1
execute unless score cancel_recipe gm4_zc_data matches 2 if score popped_chorus_fullness gm4_zc_chorus matches ..-1 run scoreboard players set cancel_recipe gm4_zc_data 1
execute if score cancel_recipe gm4_zc_data matches 1 run function gm4_zauber_cauldrons:recipes/chorus/blurry_wormhole/prepare

# start complete recipe
execute if score cancel_recipe gm4_zc_data matches 0 run function gm4_zauber_cauldrons:recipes/chorus/precise_wormhole/prepare

# use water and play sound once a recipe ran
execute if score recipe_success gm4_zc_data matches 1 at @s if score @s gm4_zc_fullness > expected_item_amount gm4_zc_fullness run function gm4_zauber_cauldrons:cauldron/structure/use_extra_items
execute if score recipe_success gm4_zc_data matches 1 at @s run function gm4_zauber_cauldrons:cauldron/structure/use_water

# reset fake players
scoreboard players reset cancel_recipe gm4_zc_data
