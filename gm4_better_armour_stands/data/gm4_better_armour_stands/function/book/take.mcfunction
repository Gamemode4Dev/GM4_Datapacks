# @s = player taking writable_book from armor_stand
# at @s
# run from advancement book/take

advancement revoke @s only gm4_better_armour_stands:book/take

# remove ignore tag from writable_book
item modify entity @s weapon.mainhand gm4_better_armour_stands:remove_ignore
