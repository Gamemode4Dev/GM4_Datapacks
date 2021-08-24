# @s = player right clicking armor_stand with writable_book
# at @s
# run from use_book and ray

# Continue searching if no armor_stand in this block
execute unless entity @e[type=minecraft:armor_stand,predicate=gm4_better_armour_stands:holding/mainhand/book_and_quill,dx=0,limit=1] if entity @s[distance=..5] positioned ^ ^ ^.1 run function gm4_better_armour_stands:ray

# Found armor_stand holding writable_book
execute as @e[type=minecraft:armor_stand,tag=!gm4_no_edit,dx=0,predicate=gm4_better_armour_stands:holding/mainhand/book_and_quill,sort=nearest,limit=1] at @s run function gm4_better_armour_stands:store_book_pages
