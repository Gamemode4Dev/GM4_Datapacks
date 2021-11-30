# player holding writable_book
execute as @a[gamemode=!spectator,predicate=gm4_better_armour_stands:holding/mainhand/book_and_quill] at @s run function gm4_better_armour_stands:book/hold

# remove right click detection on armor_stand with no arms if player is too far away
execute as @e[type=armor_stand,tag=gm4_bas_no_arms] at @s unless entity @p[distance=..6,predicate=gm4_better_armour_stands:holding/mainhand/book_arms] run function gm4_better_armour_stands:toggle/arms_detect_remove

# detect broken armor_stand
execute as @a[tag=gm4_bas_track] at @s unless entity @e[type=armor_stand,tag=gm4_bas_track,distance=..10] run function gm4_better_armour_stands:pose/set

# no tracked player within range
execute as @e[type=armor_stand,tag=gm4_bas_track] at @s unless entity @p[tag=gm4_bas_track,distance=..10] run function gm4_better_armour_stands:pose/set_no_player

# remove leftover temporary entities
execute as @e[tag=gm4_bas_temp,sort=random,limit=1] at @s unless entity @e[type=armor_stand,tag=gm4_bas_track,distance=..6] run tp @s ~ -10000 ~

schedule function gm4_better_armour_stands:main 16t
