# turn armor_stand
execute as @e[type=armor_stand,scores={gm4_bas_turn=1..}] at @s run function gm4_better_armour_stands:turn

schedule function gm4_better_armour_stands:tick 1t
