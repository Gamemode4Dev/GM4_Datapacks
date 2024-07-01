# as book binder marker armor stands with enchanted book in hand
# at @s
#run from binder/recipes/check_recipes

# transfer enchants onto pages
data modify storage gm4_book_binders:temp stored_enchantments set from entity @s HandItems[0].components."minecraft:stored_enchantments".levels
loot spawn ~ ~-0.26 ~ loot gm4_book_binders:debind_book

# advancement
advancement grant @a[distance=..3,gamemode=!spectator] only gm4:book_binders_debind

# delete used up book
data remove entity @s HandItems[0]

# sounds and visuals
playsound minecraft:block.beehive.shear master @a ~ ~ ~ 0.4 0.1
particle minecraft:item{item:"minecraft:enchanted_book"} ^-.15 ^1.05 ^.05 .1 .1 .1 .07 6
