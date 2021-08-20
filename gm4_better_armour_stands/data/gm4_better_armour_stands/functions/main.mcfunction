# player holding book and quill
execute as @a[gamemode=!spectator,predicate=gm4_better_armour_stands:holding_book_and_quill] at @s run function gm4_better_armour_stands:holding_book

# remove right click detection on armor_stand with no arms if player is too far away
execute as @e[type=armor_stand,tag=gm4_bas_no_arm] at @s unless entity @p[distance=..4] run function gm4_better_armour_stands:toggle/arms_detect_remove

# detect broken armor_stand
execute as @a[tag=gm4_bas_track] at @s unless entity @e[type=armor_stand,tag=gm4_bas_track,distance=..6] run function gm4_better_armour_stands:pose/set

schedule function gm4_better_armour_stands:main 16t
