# @s a book binder NOT inside a lectern, with items in the foot slot
# at @s
# run from gm4_book_binders:binder/placement/kill

#move the foot item with the lectern's inventory to the hand slot and then run the debinder to drop it all as pages
item replace entity @s weapon.mainhand from entity @s armor.feet
function gm4_book_binders:binder/recipes/debind
