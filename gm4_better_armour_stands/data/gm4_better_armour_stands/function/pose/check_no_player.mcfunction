# scheduled from pose/select/success

# no tracked player within range
execute as @e[type=armor_stand,tag=gm4_bas_track] at @s unless entity @p[tag=gm4_bas_track,distance=..10] run function gm4_better_armour_stands:pose/set_no_player

# repeat check
execute if entity @e[type=armor_stand,tag=gm4_bas_track] run schedule function gm4_better_armour_stands:pose/check_no_player 16t
