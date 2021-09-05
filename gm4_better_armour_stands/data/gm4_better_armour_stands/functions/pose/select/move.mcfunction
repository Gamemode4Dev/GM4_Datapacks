# @s = armor_stand to be modified
# at @s
# run from pose/select

scoreboard players set @s gm4_bas_mode 7

# check distance
execute if entity @p[tag=gm4_bas_active,distance=..1] run scoreboard players set @s gm4_bas_move 1
execute if entity @p[tag=gm4_bas_active,distance=1..2] run scoreboard players set @s gm4_bas_move 2
execute if entity @p[tag=gm4_bas_active,distance=2..3] run scoreboard players set @s gm4_bas_move 3
execute if entity @p[tag=gm4_bas_active,distance=3..] run scoreboard players set @s gm4_bas_move 4
