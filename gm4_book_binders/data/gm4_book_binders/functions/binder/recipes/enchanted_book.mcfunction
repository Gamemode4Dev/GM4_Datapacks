# as book binder marker armor stands with enchanted book in hand
# at @s
#run from binder/recipes/check_recipes

# transfer enchants onto pages
function gm4_book_binders:binder/recipes/debinding

# delete used up book
data remove entity @s HandItems[0]

# sounds and visuals
playsound minecraft:block.beehive.shear master @a ~ ~ ~ 0.4 0.1
particle item enchanted_book ^-.15 ^1.05 ^.05 .1 .1 .1 .07 6
