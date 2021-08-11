# @s = armor_stand to be modified
# at @s
# run from ray

tag @s add gm4_bas_active

# Get book contents
data modify storage gm4_better_armour_stands:temp pages set from entity @s HandItems[0].tag.pages
data modify storage gm4_better_armour_stands:temp book set from entity @s HandItems[0].tag

# Check valid codes and apply to armor_stand
function #gm4_better_armour_stands:apply_book

# Restore item held by armor_stand and book from player
item replace entity @s weapon.mainhand from entity @p[tag=gm4_bas_user] weapon.mainhand
item replace entity @p[tag=gm4_bas_user] weapon.mainhand with minecraft:writable_book
item modify entity @p[tag=gm4_bas_user] weapon.mainhand gm4_better_armour_stands:book

# Reset storage
data remove storage gm4_better_armour_stands:temp pages
data remove storage gm4_better_armour_stands:temp book

tag @s remove gm4_bas_active
