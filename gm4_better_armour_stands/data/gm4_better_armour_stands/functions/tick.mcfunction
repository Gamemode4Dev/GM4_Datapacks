# update values for tracked armor_stand, for pose/move/rotate
execute at @a[tag=gm4_bas_track] as @e[type=armor_stand,tag=gm4_bas_track] if score @s gm4_bas_id = @p[tag=gm4_bas_track] gm4_bas_id positioned ~ ~1.6 ~ run function gm4_better_armour_stands:pose/track/update

# turn armor_stand
execute as @e[type=armor_stand,tag=gm4_bas_turn] at @s run function gm4_better_armour_stands:turn

schedule function gm4_better_armour_stands:tick 1t
