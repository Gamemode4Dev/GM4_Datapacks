#@s=zauber cauldron with overflow items
#run from recipes
#at @s

#calculate how many excess items are in the recipe
scoreboard players operation @s gm4_zc_fullness -= expected_item_amount gm4_zc_fullness

#absorb possessed items into a bottle if present
scoreboard players set bottled_possessed_items gm4_zc_data 0
execute if score bottle_count gm4_zc_fullness matches 1.. if score @s gm4_zc_fullness matches 2.. align xyz run function zauber_cauldrons:cauldron/extra_items/prepare_bottle

#summon possessed items if no bottle present
execute if score bottled_possessed_items gm4_zc_data matches 0 run function zauber_cauldrons:cauldron/extra_items/create_possessed_items

#reset fake players
scoreboard players reset bottled_possessed_items gm4_zc_data
