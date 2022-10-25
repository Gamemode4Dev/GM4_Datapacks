# @s = player holding a infinitas bucket in one or the other hand
# run from metallurgy:shamir_in_hand

execute as @e[tag=gm4_no_infinitas] at @s unless entity @a[predicate=gm4_metallurgy:infinitas_active,distance=..10] run tag @s remove gm4_no_infinitas
execute positioned ~-5 ~-1 ~-5 run tag @e[type=!player,tag=!smithed.strict,dx=10,dy=2,dz=10,nbt={DeathTime:0s}] add gm4_in_infinitas
execute positioned ~-5 ~-1 ~-5 run tag @e[type=item,dx=10,dy=2,dz=10] add gm4_in_infinitas
tag @e[tag=gm4_in_infinitas,distance=..1.2] add gm4_no_infinitas
tag @e[tag=gm4_no_infinitas] remove gm4_in_infinitas

#sounds
execute if entity @e[tag=gm4_in_infinitas,distance=6..8] run playsound ui.toast.out player @a[distance=..10] ~ ~ ~ .5 .1
execute if entity @e[tag=gm4_in_infinitas,distance=3..5.99] run playsound ui.toast.out player @a[distance=..10] ~ ~ ~ .5 .3
execute if entity @e[tag=gm4_in_infinitas,distance=..2.99] run playsound ui.toast.out player @a[distance=..10] ~ ~ ~ .5 .7
