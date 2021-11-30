# @s = armor_stand to be modified
# at @s
# run from book/apply

# check for item in hand slot
data modify storage gm4_better_armour_stands:temp Item set from entity @s HandItems[0]
execute if data storage gm4_better_armour_stands:temp Item.Count run function gm4_better_armour_stands:equip/remove/hand

# move item from player to armour stand
item replace entity @s weapon.mainhand from entity @p[tag=gm4_bas_active,predicate=!gm4_better_armour_stands:holding/offhand/nothing] weapon.offhand gm4_better_armour_stands:count
item modify entity @p[tag=gm4_bas_active,predicate=!gm4_better_armour_stands:holding/offhand/nothing] weapon.offhand gm4_better_armour_stands:remove_item
