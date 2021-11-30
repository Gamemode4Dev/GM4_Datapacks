# @s = armor_stand to be modified
# at @s
# run from book/ray

# Get book contents
data modify storage gm4_better_armour_stands:temp book set from entity @s HandItems[0].tag
data modify storage gm4_better_armour_stands:temp pages set from storage gm4_better_armour_stands:temp book.pages

# Restore item held by armor_stand and book from player, with fix for creative mode
execute if entity @p[tag=gm4_bas_active,gamemode=creative,predicate=gm4_better_armour_stands:holding/mainhand/book_and_quill] run item replace entity @s weapon.mainhand with air
execute unless entity @p[tag=gm4_bas_active,gamemode=creative,predicate=gm4_better_armour_stands:holding/mainhand/book_and_quill] run item replace entity @s weapon.mainhand from entity @p[tag=gm4_bas_active] weapon.mainhand
item replace entity @p[tag=gm4_bas_active] weapon.mainhand with minecraft:writable_book
item modify entity @p[tag=gm4_bas_active] weapon.mainhand gm4_better_armour_stands:book

# Check valid codes and apply to armor_stand
execute unless entity @s[tag=gm4_bas_track] run function #gm4_better_armour_stands:apply_book
execute unless entity @s[tag=gm4_bas_valid_code] run function gm4_better_armour_stands:book/invalid
tag @s remove gm4_bas_valid_code

# Reset storage
data remove storage gm4_better_armour_stands:temp pages
data remove storage gm4_better_armour_stands:temp book

# Show invisible armour stand
effect give @s[nbt={Invisible:1b}] glowing 2 0
