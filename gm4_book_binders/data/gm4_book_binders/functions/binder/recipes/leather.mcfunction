# as book binder marker armor stands with leather in hand
# at @s
#run from binder/recipes/check_recipes

# summon empty enchanted book
summon item ~ ~-0.26 ~ {Tags:["gm4_empty_enchanted_book"],PickupDelay:0s,Item:{id:"minecraft:enchanted_book",Count:1b,tag:{StoredEnchantments:[]}}}

# remove the leather
data remove entity @s HandItems[0]

# compose enchants
function gm4_book_binders:binder/recipes/binding

# reset tags
tag @s remove gm4_book_binder_with_page
tag @e[type=item,distance=..0.3] remove gm4_empty_enchanted_book

# sounds and visuals
playsound item.armor.equip_leather block @a ~ ~ ~ 0.4 1.5
particle crit ^-.15 ^1.05 ^.05 .1 0 .1 .1 8
