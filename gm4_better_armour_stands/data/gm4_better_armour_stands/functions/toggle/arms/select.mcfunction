# @s = armor_stand to be modified
# at @s
# run from book/ray_arms

# get book data
data modify storage gm4_better_armour_stands:temp pages set from entity @a[tag=gm4_bas_active,limit=1] SelectedItem.tag.pages

# apply to armor_stand
function #gm4_better_armour_stands:apply_book

# remove detection
function gm4_better_armour_stands:toggle/arms/remove_detection
tag @s remove gm4_bas_selected
