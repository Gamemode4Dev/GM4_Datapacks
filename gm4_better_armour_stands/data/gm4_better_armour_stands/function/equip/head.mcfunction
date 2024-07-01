# @s = armor_stand to be modified
# at @s
# run from equip/select

# check for item in head slot
execute if items entity @s armor.head * run function gm4_better_armour_stands:equip/remove/head

# move item from player to armour stand
item replace entity @s armor.head from entity @a[tag=gm4_bas_active,limit=1,predicate=!gm4_better_armour_stands:holding/offhand/nothing] weapon.offhand gm4_better_armour_stands:count
item modify entity @a[gamemode=!creative,tag=gm4_bas_active,limit=1,predicate=!gm4_better_armour_stands:holding/offhand/nothing] weapon.offhand gm4_better_armour_stands:remove_item
