# @s = armor_stand to be moved
# at @s
# run from pose/select

scoreboard players set @s gm4_bas_mode 7

execute store result score @s gm4_bas_data run data get entity @s Small

# spawn detectors
execute if score @s gm4_bas_data matches 0 run function gm4_better_armour_stands:pose/select/move_tall
execute if score @s gm4_bas_data matches 1 run summon minecraft:area_effect_cloud ~ ~.5 ~ {Tags:["gm4_bas_part2"],Radius:0.126f}

# detect what player is looking at
execute if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/move/part2] run scoreboard players set @s gm4_bas_move_y 2
execute unless score @s gm4_bas_move_y matches 1.. if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/move/part3] run scoreboard players set @s gm4_bas_move_y 3
execute unless score @s gm4_bas_move_y matches 1.. if entity @a[tag=gm4_bas_active,limit=1,predicate=gm4_better_armour_stands:select/move/part4] run scoreboard players set @s gm4_bas_move_y 4
execute unless score @s gm4_bas_move_y matches 1.. run scoreboard players set @s gm4_bas_move_y 1

# check distance
execute if entity @a[tag=gm4_bas_active,limit=1,distance=..1] run scoreboard players set @s gm4_bas_move 1
execute if entity @a[tag=gm4_bas_active,limit=1,distance=1..2] run scoreboard players set @s gm4_bas_move 2
execute if entity @a[tag=gm4_bas_active,limit=1,distance=2..3] run scoreboard players set @s gm4_bas_move 3
execute if entity @a[tag=gm4_bas_active,limit=1,distance=3..] run scoreboard players set @s gm4_bas_move 4
