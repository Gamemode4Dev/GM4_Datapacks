execute as @e[type=item,nbt={Item:{id:"minecraft:firework_star",count:1,tag:{gm4_everstone:1b}},OnGround:1b}] at @s run function gm4_everstone:age_locking/check

schedule function gm4_everstone:main 16t
