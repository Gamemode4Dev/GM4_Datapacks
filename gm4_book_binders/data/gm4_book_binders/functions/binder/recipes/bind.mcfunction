# as book binder marker armor stands with leather in hand
# at @s
#run from binder/recipes/check_recipes

# summon empty enchanted book
summon item ~ ~-0.26 ~ {Tags:["gm4_empty_enchanted_book"],PickupDelay:0s,Item:{id:"minecraft:enchanted_book",count:1}}

# remove the leather
item replace entity @s weapon.mainhand with minecraft:air

# compose enchants
item replace entity @e[type=item,tag=gm4_empty_enchanted_book,distance=..0.3] contents from entity @s armor.feet

# advancement
advancement grant @a[distance=..3,gamemode=!spectator] only gm4:book_binders_bind

# clear stored pages
data remove entity @s ArmorItems[0].components."minecraft:stored_enchantments"

# reset tags
tag @s remove gm4_book_binder_with_page
tag @e[type=item,distance=..0.3] remove gm4_empty_enchanted_book

# sounds and visuals
playsound minecraft:item.armor.equip_leather block @a ~ ~ ~ 0.4 1.5
particle crit ^-.15 ^1.05 ^.05 .1 0 .1 .1 8
