# @s = boiling zauber cauldron with grass and enchanted_prismarine_shard inside.
# at align xyz
# run from cauldron/recipe_checks

# initialise fake players
scoreboard players set cancel_recipe gm4_zc_data 0
# set expected fullness for these recipes
scoreboard players operation $expected_item_amount gm4_zc_fullness = required_flowers gm4_zc_flowers
# add two to expected items (grass and enchanted_prismarine_shard)
scoreboard players add $expected_item_amount gm4_zc_fullness 2

# poisonous flowers set flag to abort recipe checks
execute if score red_tulip gm4_zc_flowers matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:red_tulip"}}] run scoreboard players set cancel_recipe gm4_zc_data 1
execute if score orange_tulip gm4_zc_flowers matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:orange_tulip"}}] run scoreboard players set cancel_recipe gm4_zc_data 1
execute if score white_tulip gm4_zc_flowers matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:white_tulip"}}] run scoreboard players set cancel_recipe gm4_zc_data 1
execute if score pink_tulip gm4_zc_flowers matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:pink_tulip"}}] run scoreboard players set cancel_recipe gm4_zc_data 1
execute if score oxeye_daisy gm4_zc_flowers matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:oxeye_daisy"}}] run scoreboard players set cancel_recipe gm4_zc_data 1
execute if score dandelion gm4_zc_flowers matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:dandelion"}}] run scoreboard players set cancel_recipe gm4_zc_data 1
execute if score blue_orchid gm4_zc_flowers matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:blue_orchid"}}] run scoreboard players set cancel_recipe gm4_zc_data 1
execute if score allium gm4_zc_flowers matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:allium"}}] run scoreboard players set cancel_recipe gm4_zc_data 1
execute if score azure_bluet gm4_zc_flowers matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:azure_bluet"}}] run scoreboard players set cancel_recipe gm4_zc_data 1
execute if score poppy gm4_zc_flowers matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:poppy"}}] run scoreboard players set cancel_recipe gm4_zc_data 1
execute if score cornflower gm4_zc_flowers matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:cornflower"}}] run scoreboard players set cancel_recipe gm4_zc_data 1
execute if score lily_of_the_valley gm4_zc_flowers matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:lily_of_the_valley"}}] run scoreboard players set cancel_recipe gm4_zc_data 1

# recipe
execute if score cancel_recipe gm4_zc_data matches 0 run function gm4_zauber_cauldrons:recipes/flowers/check_normal_flowers

# effect with poison if poisonous flower in cauldron
execute if score cancel_recipe gm4_zc_data matches 1 at @s run function gm4_zauber_cauldrons:recipes/flowers/poison

# use water and play sound once a recipe ran
execute if score $recipe_success gm4_zc_data matches 1 at @s if score @s gm4_zc_fullness > $expected_item_amount gm4_zc_fullness run function gm4_zauber_cauldrons:cauldron/structure/use_extra_items
execute if score $recipe_success gm4_zc_data matches 1 at @s run function gm4_zauber_cauldrons:cauldron/structure/use_water

# reset fake players
scoreboard players reset cancel_recipe gm4_zc_data
