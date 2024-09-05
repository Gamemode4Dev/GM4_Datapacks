# @s any book binder armor stand in lectern with book on actual lectern
# at @s
# run from gm4_book_binders:process_binder

data merge entity @s {DisabledSlots:2039583,Marker:1b}
tag @s remove gm4_book_binder_active

# kill armor stands that are no longer in a lectern
execute unless block ~ ~ ~ lectern run function gm4_book_binders:binder/placement/kill
