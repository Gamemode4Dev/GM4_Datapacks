#@s = sand ring that needs to accept a metal
# run from initialize

#add score to sand ring
scoreboard players add @s gm4_ml_ore_al 1
particle block andesite ~.45 ~0.1 ~.65 .1 .1 .1 0 9
particle block pink_terracotta ~.45 ~0.1 ~.65 .1 .1 .1 0 2
playsound item.bucket.empty_lava block @a[distance=..8] ~ ~ ~ .25 1.5
kill @e[type=item,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{ore_type:"aluminium"}}},OnGround:1b},tag=gm4_ml_in_animation,dx=0,dz=0]
