
particle sculk_charge_pop ~ ~0.2 ~ 0.025 0.025 0.025 0.015 6
playsound minecraft:block.sculk_sensor.clicking_stop neutral @a[distance=..8] ~ ~ ~ 0.7 2
ride @s mount @e[type=trident,tag=gm4_hy_target,limit=1]
scoreboard players add $hopper.items_sucked gm4_hy_data 1
