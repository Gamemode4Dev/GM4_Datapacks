# scheduled from toggle/lock/detect_interaction

# remove temporary interaction with locked armor_stand
execute as @e[type=armor_stand,tag=gm4_bas_temp_unlock] at @s unless entity @p[predicate=gm4_better_armour_stands:holding/mainhand/book_unlock,distance=..6] run function gm4_better_armour_stands:toggle/lock/remove_temp_unlock

# repeat check
execute if entity @e[type=armor_stand,tag=gm4_bas_temp_unlock] run schedule function gm4_better_armour_stands:toggle/lock/check 16t
