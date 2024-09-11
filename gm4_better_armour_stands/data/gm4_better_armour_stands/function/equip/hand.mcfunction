# @s = armor_stand to be modified
# at @s
# run from equip/select

# check for item in hand slot
execute if items entity @s weapon.mainhand * run function gm4_better_armour_stands:equip/remove/hand

# move item from player to armor_stand
item replace entity @s weapon.mainhand from entity @a[tag=gm4_bas_active,limit=1,predicate=!gm4_better_armour_stands:holding/offhand/nothing] weapon.offhand gm4_better_armour_stands:count
item modify entity @a[gamemode=!creative,tag=gm4_bas_active,limit=1,predicate=!gm4_better_armour_stands:holding/offhand/nothing] weapon.offhand gm4_better_armour_stands:remove_item

# add ignore tag to writable_book
item modify entity @s[predicate=gm4_better_armour_stands:holding/mainhand/book_and_quill] weapon.mainhand gm4_better_armour_stands:add_ignore
