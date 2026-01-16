

execute store result entity @s transformation.scale[0] float 0.00002 run data get storage gm4_horsemanship:temp scale 100000
execute store result entity @s transformation.scale[1] float 0.00002 run data get storage gm4_horsemanship:temp scale 100000
execute store result entity @s transformation.scale[2] float 0.00002 run data get storage gm4_horsemanship:temp scale 100000


# forward / side
execute store result entity @s[tag=gm4_horse.glider_wing.right] transformation.translation[0] float -0.00025 run data get storage gm4_horsemanship:temp scale 1000
execute store result entity @s[tag=gm4_horse.glider_wing.left] transformation.translation[0] float 0.00025 run data get storage gm4_horsemanship:temp scale 1000
execute store result entity @s transformation.translation[1] float -0.0001875 run data get storage gm4_horsemanship:temp scale 1000
execute store result entity @s transformation.translation[2] float 0.00095 run data get storage gm4_horsemanship:temp scale 1000

tag @s remove gm4_horse.new_glider_wing
ride @s mount @e[type=#gm4_horsemanship:trainable,tag=gm4_horse.target,distance=..0.1,limit=1]

scoreboard players set @s gm4_horse.wing_timer 0
