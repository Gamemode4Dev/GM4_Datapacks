# @s a book binder NOT inside a lectern, with items in the foot slot
# at @s
# run from gm4_book_binders:binder/placement/kill

#move the foot item with the lectern's inventory to the hand slot and then run the debinder to drop it all as pages
data modify entity @s HandItems[0] set from entity @s ArmorItems[0]
function gm4_book_binders:binder/recipes/enchanted_book
