#@s = soul glass AEC
#run from process

setblock ~ ~ ~ air
summon item ~ ~ ~ {Motion:[0.0,0.2,0.0],PickupDelay:10s,Item:{id:"minecraft:brown_stained_glass",Count:1b,tag:{CustomModelData:3420002,gm4_soul_glass:1b,Enchantments:[{id:"minecraft:protection",lvl:0s}],HideFlags:1,display:{Name:'{"translate":"%1$s%3427655$s","with":["Soul Glass",{"translate":"item.gm4.soul_glass"}],"italic":false}'}}}}
playsound minecraft:block.fire.extinguish block @a[distance=..10] ~ ~ ~ .4

kill @s
