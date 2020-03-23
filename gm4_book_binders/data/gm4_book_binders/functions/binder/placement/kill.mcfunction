# @s a book binder NOT inside a lectern
# at @s
# run from gm4_book_binders:binder/placement/disable

# check for the existence of an hand item
scoreboard players reset has_hand_item gm4_binder_data
execute store success score has_hand_item gm4_binder_data if entity @s[nbt={HandItems:[{Count:1b}]}]

# drop hand items if necessary
execute if score has_hand_item gm4_binder_data matches 1.. run function gm4_book_binders:binder/placement/drop_hand_item

# check for the existence of an hand item
scoreboard players reset has_stored_item gm4_binder_data
execute store success score has_stored_item gm4_binder_data unless entity @s[nbt={ArmorItems:[{tag:{StoredEnchantments:[]}}]}]

# drop internally stored pages if necessary
execute if score has_stored_item gm4_binder_data matches 1.. run function gm4_book_binders:binder/placement/drop_stored_item

# kill armor stand
kill @s
