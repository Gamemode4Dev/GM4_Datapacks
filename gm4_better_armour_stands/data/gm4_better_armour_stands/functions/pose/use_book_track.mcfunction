# @s = player giving writable_book to armor_stand
# at @s
# run from advancement use_book_track

advancement revoke @s only gm4_better_armour_stands:use_book_track

# Get book contents
data modify storage gm4_better_armour_stands:temp book set from entity @e[type=armor_stand,tag=gm4_bas_track,distance=..6,sort=nearest,limit=1] HandItems[0].tag

# Restore item held by armor_stand and book from player, with fix for creative mode
execute if entity @s[gamemode=creative,predicate=gm4_better_armour_stands:holding/mainhand/book_and_quill] run item replace entity @e[type=armor_stand,tag=gm4_bas_track,distance=..6,sort=nearest,limit=1] weapon.mainhand with air
execute unless entity @s[gamemode=creative,predicate=gm4_better_armour_stands:holding/mainhand/book_and_quill] run item replace entity @e[type=armor_stand,tag=gm4_bas_track,distance=..6,sort=nearest,limit=1] weapon.mainhand from entity @s weapon.mainhand
item replace entity @s weapon.mainhand with minecraft:writable_book
item modify entity @s weapon.mainhand gm4_better_armour_stands:book

# Reset storage
data remove storage gm4_better_armour_stands:temp book

# Stop tracking
function gm4_better_armour_stands:pose/set
