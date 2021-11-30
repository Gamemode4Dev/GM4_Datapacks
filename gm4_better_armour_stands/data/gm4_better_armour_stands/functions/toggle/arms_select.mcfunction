# @s = armor_stand to be modified
# at @s
# run from main

tp @e[type=wandering_trader,tag=gm4_bas_arms_detect,distance=..1,sort=nearest,limit=1] ~ -10000 ~

# get book data
data modify storage gm4_better_armour_stands:temp pages set from entity @a[tag=gm4_bas_active,limit=1] SelectedItem.tag.pages

# apply to armor_stand
function #gm4_better_armour_stands:apply_book

tag @s remove gm4_bas_valid_code
tag @s remove gm4_bas_no_arms
tag @s remove gm4_bas_selected
