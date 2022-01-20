# @s = armor_stand to be moved
# at @s
# run from pose/select

scoreboard players set @s gm4_bas_mode 7
tp @s ~ ~ ~

# reset previous data
scoreboard players reset @s gm4_bas_dist
scoreboard players reset @s gm4_bas_dx
scoreboard players reset @s gm4_bas_dy
scoreboard players reset @s gm4_bas_dz

# skip some calculations if coordinate values too high (>2M)
tag @s remove gm4_bas_move_alt
tag @s[predicate=!gm4_better_armour_stands:coord_check] add gm4_bas_move_alt

# calculate distance/offset 
execute at @a[tag=gm4_bas_active,limit=1] positioned ~ ~1.6 ~ positioned ^ ^ ^.5 run function gm4_better_armour_stands:pose/select/move/ray

# store current data
data modify storage gm4_better_armour_stands:temp Data.Pos set from entity @s Pos
