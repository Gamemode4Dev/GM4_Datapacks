# as book binder marker armor stands
# at @s
#run from gm4_book_binders:process_binders

# check for binding/debinding
execute if items entity @s weapon.* minecraft:paper[custom_data~{gm4_book_binders:{item:"enchanted_page"}}] run function gm4_book_binders:binder/recipes/page
execute if items entity @s weapon.* minecraft:enchanted_book run function gm4_book_binders:binder/recipes/enchanted_book
execute if items entity @s[tag=gm4_book_binder_with_page] weapon.* minecraft:leather run function gm4_book_binders:binder/recipes/leather
