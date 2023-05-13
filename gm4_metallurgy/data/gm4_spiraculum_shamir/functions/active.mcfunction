# @s = player holding a spiraculum bucket in one or the other hand
# run from metallurgy:shamir_in_hand

tag @s add gm4_has_spiraculum
execute as @e[tag=gm4_no_spiraculum] at @s unless entity @a[tag=gm4_has_spiraculum,distance=..10] run tag @s remove gm4_no_spiraculum
execute positioned ~-5 ~-1 ~-5 run tag @e[type=!player,tag=!smithed.strict,dx=10,dy=2,dz=10,nbt={DeathTime:0s}] add gm4_in_spiraculum
execute positioned ~-5 ~-1 ~-5 run tag @e[type=item,dx=10,dy=2,dz=10] add gm4_in_spiraculum
tag @e[tag=gm4_in_spiraculum,distance=..1.2] add gm4_no_spiraculum
tag @e[tag=gm4_no_spiraculum] remove gm4_in_spiraculum

#sounds
execute if entity @e[tag=gm4_in_spiraculum,distance=6..8] run playsound ui.toast.out player @a[distance=..10] ~ ~ ~ .5 .1
execute if entity @e[tag=gm4_in_spiraculum,distance=3..5.99] run playsound ui.toast.out player @a[distance=..10] ~ ~ ~ .5 .3
execute if entity @e[tag=gm4_in_spiraculum,distance=..2.99] run playsound ui.toast.out player @a[distance=..10] ~ ~ ~ .5 .7
