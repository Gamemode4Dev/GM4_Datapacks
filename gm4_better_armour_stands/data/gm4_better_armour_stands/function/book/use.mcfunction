# @s = player giving writable_book to armor_stand
# at @s
# run from advancement book/use

# select targeted armor_stand and process book
tag @s add gm4_bas_active
execute as @e[type=minecraft:armor_stand,tag=!gm4_no_edit,tag=!smithed.entity,distance=..6,limit=1,predicate=gm4_better_armour_stands:holding/mainhand/book_and_quill,predicate=!gm4_better_armour_stands:holding/mainhand/book_ignore] at @s run function gm4_better_armour_stands:book/process
tag @s remove gm4_bas_active

advancement revoke @s[tag=!gm4_bas_track] only gm4_better_armour_stands:book/use
