# run from main
# @s = writable_book ..1 from armor_stand

data modify storage gm4_better_armour_stands:temp pages set from entity @s Item.tag.pages
tag @s add gm4_bas_book
execute as @e[type=armor_stand,tag=!gm4_no_edit,sort=nearest,limit=1,distance=..1] at @s run function #gm4_better_armour_stands:apply_book
data remove storage gm4_better_armour_stands:temp pages
tag @s remove gm4_bas_book
