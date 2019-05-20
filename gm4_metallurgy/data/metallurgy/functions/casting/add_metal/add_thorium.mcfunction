#@s = sand ring that needs to accept a metal
# run from initialize

#add score to sand ring
scoreboard players add @s gm4_ml_ore_th 1
particle block diorite ~.45 ~0.1 ~.65 .1 .1 .1 0 9
particle block dead_fire_coral_block ~.45 ~0.1 ~.65 .1 .1 .1 0 2
playsound item.bucket.empty_lava block @a[distance=..8] ~ ~ ~ .25 1.5
advancement grant @a[distance=..5,gamemode=!spectator] only gm4:metallurgy_cast
kill @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,limit=1,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{ore_type:"thorium"}}},OnGround:1b}]
