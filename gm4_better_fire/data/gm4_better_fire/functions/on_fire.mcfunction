# @s, flame arrow or creeper on fire
# runs from main

#fire arrows place fire
execute as @s[type=arrow,tag=!gm4_bf_ignore,nbt={inGround:1b}] if data entity @s Fire at @s run function gm4_better_fire:arrow

#make creepers explode when on fire and low on Health
execute if entity @s[type=creeper] store result score @s gm4_creep_health run data get entity @s Health 1
data merge entity @s[type=creeper,scores={gm4_creep_health=0..2}] {Fuse:0}
