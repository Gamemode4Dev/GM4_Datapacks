execute as @a[gamemode=!spectator,predicate=gm4_better_armour_stands:holding_book_and_quill] at @s run function gm4_better_armour_stands:holding_book
execute as @e[type=armor_stand,tag=gm4_bas_no_arm] at @s unless entity @p[distance=..4] run function gm4_better_armour_stands:toggle/arms_detect_remove

schedule function gm4_better_armour_stands:main 16t
