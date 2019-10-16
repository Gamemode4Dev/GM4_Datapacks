#fire arrows place fire
execute at @e[nbt=!{Fire:-1s},type=arrow] run setblock ~ ~ ~ fire keep

#make creepers explode when on fire and low on Health
execute as @e[nbt=!{Fire:-1s},type=creeper] store result score @s gm4_creep_health run data get entity @s Health 1
execute as @e[type=creeper,scores={gm4_creep_health=0..2}] run data merge entity @s {Fuse:0}

schedule function better_fire:main 16t
