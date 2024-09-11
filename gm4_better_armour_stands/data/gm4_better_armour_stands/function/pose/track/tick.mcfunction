# update values for tracked armor_stand, for pose/move/rotate
execute as @a[tag=gm4_bas_track] at @s run function gm4_better_armour_stands:pose/track/select_armour_stand

# repeat tracking loop
execute if entity @a[tag=gm4_bas_track,limit=1] run schedule function gm4_better_armour_stands:pose/track/tick 1t
