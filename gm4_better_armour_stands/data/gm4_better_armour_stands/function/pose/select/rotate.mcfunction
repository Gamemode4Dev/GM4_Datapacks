# @s = armor_stand to be moved
# at @s
# run from pose/select

scoreboard players set @s gm4_bas_mode 8

# store current data
data modify storage gm4_better_armour_stands:temp Data.Rotation set from entity @s Rotation
