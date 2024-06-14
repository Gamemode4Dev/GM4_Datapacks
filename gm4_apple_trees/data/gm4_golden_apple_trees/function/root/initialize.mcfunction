# initializes the golden root
# @s = uninitialized golden root marker
# located at @s
# run from gm4_apple_trees:main

# set salt based on seed and position
execute store result score $x gm4_ga_root run data get entity @s Pos[0]
execute store result score $y gm4_ga_root run data get entity @s Pos[1]
execute store result score $z gm4_ga_root run data get entity @s Pos[2]
execute store result score $salt gm4_ga_root run seed

scoreboard players operation $salt gm4_ga_root *= $x gm4_ga_root
scoreboard players operation $salt gm4_ga_root *= $y gm4_ga_root
scoreboard players operation $salt gm4_ga_root *= $z gm4_ga_root

# set initial rotation
scoreboard players operation $rotation gm4_ga_root = $salt gm4_ga_root
scoreboard players operation $rotation gm4_ga_root %= #3600 gm4_ga_root
execute store result entity @s Rotation[0] float 0.1 run scoreboard players get $rotation gm4_ga_root
scoreboard players reset $rotation gm4_ga_root

# set offset
scoreboard players operation $offset gm4_ga_root = $salt gm4_ga_root
scoreboard players operation $rotation gm4_ga_root %= #4 gm4_ga_root
execute if score $offset gm4_ga_root matches 0 run tp @s ~0.1 ~ ~
execute if score $offset gm4_ga_root matches 1 run tp @s ~-0.1 ~ ~
execute if score $offset gm4_ga_root matches 2 run tp @s ~ ~ ~0.1
execute if score $offset gm4_ga_root matches 3 run tp @s ~ ~ ~-0.1
scoreboard players reset $offset gm4_ga_root

# update tags
data merge entity @s {Tags:["gm4_golden_root","smithed.entity","smithed.strict"]}
