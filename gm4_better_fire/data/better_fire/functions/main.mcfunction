#fire arrows place fire
execute as @e[nbt=!{Fire:-1s},type=minecraft:arrow] at @s run function better_fire:checks

#make creepers explode when on fire and low on Health
execute as @e[nbt=!{Fire:-1s},type=minecraft:creeper] store result score @s gm4_creep_health run data get entity @s Health 1
execute as @e[type=minecraft:creeper,scores={gm4_creep_health=0..2}] run data merge entity @s {Fuse:0}
