# @s = armor_stand being moved
# at @s
# run from pose/track/move

# round to nearest 1/8th of a block
execute store result entity @s Pos[0] double .125 run data get entity @s Pos[0] 8
execute store result entity @s Pos[1] double .125 run data get entity @s Pos[1] 8
execute store result entity @s Pos[2] double .125 run data get entity @s Pos[2] 8
