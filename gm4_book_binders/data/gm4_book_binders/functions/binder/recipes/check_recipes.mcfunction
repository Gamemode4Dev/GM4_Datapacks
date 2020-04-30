# as book binder marker armor stands
# at @s
#run from gm4_book_binders:process_binders

# check for binding/debinding
execute if entity @s[nbt={HandItems:[{id:"minecraft:paper",tag:{gm4_book_binders:{item:"enchanted_page"}}}]}] run function gm4_book_binders:binder/recipes/page
execute if entity @s[nbt={HandItems:[{id:"minecraft:enchanted_book"}]}] run function gm4_book_binders:binder/recipes/enchanted_book
execute if entity @s[nbt={HandItems:[{id:"minecraft:leather"}]},tag=gm4_book_binder_with_page] run function gm4_book_binders:binder/recipes/leather
