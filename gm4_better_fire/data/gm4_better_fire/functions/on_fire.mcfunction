#fire arrows place fire
execute at @s[type=arrow] run setblock ~ ~ ~ fire keep

#make creepers explode when on fire and low on Health
execute if entity @s[type=creeper] store result score @s gm4_creep_health run data get entity @s Health 1
data merge entity @s[type=creeper,scores={gm4_creep_health=0..2}] {Fuse:0}
