#@s = soul glass AEC
#run from process

setblock ~ ~ ~ air
summon item ~ ~ ~ {Motion:[0.0,0.2,0.0],PickupDelay:10s,Item:{id:"minecraft:brown_stained_glass",count:1,components:{"minecraft:custom_model_data":"item/soul_glass","minecraft:custom_data":{gm4_soul_glass:1b},"minecraft:enchantment_glint_override":true,"minecraft:custom_name":'{"translate":"item.gm4.soul_glass","fallback":"Soul Glass","italic":false}'}}}
playsound minecraft:block.fire.extinguish block @a[distance=..10] ~ ~ ~ .4

kill @s
