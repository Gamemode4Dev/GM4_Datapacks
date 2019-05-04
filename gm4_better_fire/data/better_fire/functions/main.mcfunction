#fire arrows place fire
execute as @e[type=minecraft:arrow,nbt=!{Fire:-1s},nbt={inBlockState:{}}] at @s run function better_fire:in_block

#make creepers explode when on fire and low on Health
execute as @e[type=minecraft:creeper,nbt=!{Fire:-1s}] store result score @s gm4_creep_health run data get entity @s Health 1
execute as @e[type=minecraft:creeper,scores={gm4_creep_health=0..2}] run data merge entity @s {Fuse:0}
