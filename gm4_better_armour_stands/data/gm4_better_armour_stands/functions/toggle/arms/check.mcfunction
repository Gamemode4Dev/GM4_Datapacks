# scheduled from toggle/arms/detect_interaction

# remove right click detection on armor_stand with no arms if player is too far away
execute as @e[type=armor_stand,tag=gm4_bas_no_arms] at @s unless entity @p[distance=..6,predicate=gm4_better_armour_stands:holding/mainhand/book_arms] run function gm4_better_armour_stands:toggle/arms/remove_detection

# repeat check
execute if entity @e[type=armor_stand,tag=gm4_bas_no_arms] run schedule function gm4_better_armour_stands:toggle/arms/check 16t
