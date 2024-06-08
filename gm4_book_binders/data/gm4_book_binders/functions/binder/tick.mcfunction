# @s an active book binder
# at @s
# run from gm4_book_binders:process_binders

# check for the existence of an hand item
scoreboard players reset $has_hand_item gm4_binder_data
execute store success score $has_hand_item gm4_binder_data if items entity @s weapon.* *[count=1]

# handle binders with item in hand slot
execute if score $has_hand_item gm4_binder_data matches 1.. if predicate gm4_book_binders:successful_process run function gm4_book_binders:binder/recipes/check_recipes

# look for hopper in the back and move item into hand slot
execute if score $has_hand_item gm4_binder_data matches 0 if entity @s[tag=gm4_book_binder_north] positioned ~ ~ ~1 if block ~ ~ ~ hopper[facing=north,enabled=true] if items block ~ ~ ~ container.* * run function gm4_book_binders:binder/hopper_grab
execute if score $has_hand_item gm4_binder_data matches 0 if entity @s[tag=gm4_book_binder_south] positioned ~ ~ ~-1 if block ~ ~ ~ hopper[facing=south,enabled=true] if items block ~ ~ ~ container.* * run function gm4_book_binders:binder/hopper_grab
execute if score $has_hand_item gm4_binder_data matches 0 if entity @s[tag=gm4_book_binder_east] positioned ~-1 ~ ~ if block ~ ~ ~ hopper[facing=east,enabled=true] if items block ~ ~ ~ container.* * run function gm4_book_binders:binder/hopper_grab
execute if score $has_hand_item gm4_binder_data matches 0 if entity @s[tag=gm4_book_binder_west] positioned ~1 ~ ~ if block ~ ~ ~ hopper[facing=west,enabled=true] if items block ~ ~ ~ container.* * run function gm4_book_binders:binder/hopper_grab
