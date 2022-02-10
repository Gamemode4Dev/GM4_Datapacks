# @s = zauber cauldron with overflow items
# run from use_cauldron functions
# at center of block

# calculate how many excess items are in the recipe
scoreboard players operation @s gm4_zc_fullness -= $expected_item_amount gm4_zc_fullness

# absorb possessed items into a bottle if present
scoreboard players set $bottled_possessed_items gm4_zc_data 0
execute if score $has_bottle gm4_zc_fullness matches 1.. if score @s gm4_zc_fullness matches 2.. align xyz positioned ~.5 ~.5 ~.5 run function gm4_zauber_cauldrons:cauldron/extra_items/prepare_bottle

# summon possessed items if no bottle present
execute if score $bottled_possessed_items gm4_zc_data matches 0 run function gm4_zauber_cauldrons:cauldron/extra_items/create_possessed_items

# reset fake players
scoreboard players reset $bottled_possessed_items gm4_zc_data
