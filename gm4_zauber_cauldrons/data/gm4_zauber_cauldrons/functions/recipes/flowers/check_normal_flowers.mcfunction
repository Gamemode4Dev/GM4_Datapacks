# @s = boiling zauber cauldron with grass and enchanted_prismarine_shard and NO poisonous flowers inside.
# at center of block
# run from recipes/flowers/check_poisonous_flowers

# initialise fake player (required if all flowers are poisonous/gm4_zc_flowers=1)
scoreboard players set $normal_flowers_amount gm4_zc_fullness 0
# count normal flowers
execute if score $red_tulip gm4_zc_flowers matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:red_tulip"}}}] run scoreboard players add $normal_flowers_amount gm4_zc_fullness 1
execute if score $orange_tulip gm4_zc_flowers matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:orange_tulip"}}}] run scoreboard players add $normal_flowers_amount gm4_zc_fullness 1
execute if score $white_tulip gm4_zc_flowers matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:white_tulip"}}}] run scoreboard players add $normal_flowers_amount gm4_zc_fullness 1
execute if score $pink_tulip gm4_zc_flowers matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:pink_tulip"}}}] run scoreboard players add $normal_flowers_amount gm4_zc_fullness 1
execute if score $oxeye_daisy gm4_zc_flowers matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:oxeye_daisy"}}}] run scoreboard players add $normal_flowers_amount gm4_zc_fullness 1
execute if score $dandelion gm4_zc_flowers matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:dandelion"}}}] run scoreboard players add $normal_flowers_amount gm4_zc_fullness 1
execute if score $blue_orchid gm4_zc_flowers matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:blue_orchid"}}}] run scoreboard players add $normal_flowers_amount gm4_zc_fullness 1
execute if score $allium gm4_zc_flowers matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:allium"}}}] run scoreboard players add $normal_flowers_amount gm4_zc_fullness 1
execute if score $azure_bluet gm4_zc_flowers matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:azure_bluet"}}}] run scoreboard players add $normal_flowers_amount gm4_zc_fullness 1
execute if score $poppy gm4_zc_flowers matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:poppy"}}}] run scoreboard players add $normal_flowers_amount gm4_zc_fullness 1
execute if score $cornflower gm4_zc_flowers matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:cornflower"}}}] run scoreboard players add $normal_flowers_amount gm4_zc_fullness 1
execute if score $lily_of_the_valley gm4_zc_flowers matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:lily_of_the_valley"}}}] run scoreboard players add $normal_flowers_amount gm4_zc_fullness 1

# compare amount of normal flowers in cauldron to expected amount
execute if score $normal_flowers_amount gm4_zc_fullness = $required_flowers gm4_zc_flowers run function gm4_zauber_cauldrons:recipes/flowers/luck

# reset fake players
scoreboard players reset $normal_flowers_amount gm4_zc_fullness
