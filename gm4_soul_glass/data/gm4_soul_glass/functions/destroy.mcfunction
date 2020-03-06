#@s = soul glass AEC
#run from process

setblock ~ ~ ~ air
summon item ~ ~ ~ {Motion:[0.0,0.2,0.0],PickUpDelay:10s,Item:{id:"minecraft:brown_stained_glass",Count:1b,tag:{gm4_soul_glass:1b,display:{Name:'{"text":"Soul Glass","italic":false}'}}}}
playsound minecraft:block.fire.extinguish block @a[distance=..10] ~ ~ ~ .4

kill @s
